class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist badge]
  
  def show
  end

  def result
    @badges_received = BadgeGetting.where(test_passage_id: @test_passage.id)
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      if @test_passage.passed?
        badge
        TestsMailer.completed_test(@test_passage).deliver_now
      end

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    client = GistQuestionService.new(@test_passage.current_question)
    begin
    result = client.call
    flash_options = if client.success?
                      {notice: t('.success', link: result.html_url)}
                    else
                      {alert: t('.failure')}
                    end
    rescue Octokit::UnprocessableEntity
      flash_options = {alert: t('.failure')}
    end
    add_gist_info(@test_passage.current_question, result.html_url) if client.success?
    redirect_to @test_passage, flash_options
  end

  def badge
    get_badge = BadgeAwardService.new(@test_passage.test.id, current_user)
    Badge.all.each do |badge|
      if get_badge.send("#{badge.condition}_check?", badge)
        get_badge.add_badge_to_user(badge, @test_passage.id)
      end
    end
  end

  private

  def add_gist_info(question, url)
    current_user.gists.create(question_id: question.id, url: url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

