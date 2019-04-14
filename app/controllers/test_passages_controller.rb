class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  
  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
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
    add_gist_info(@test_passage.current_question, result.html_url)
    redirect_to @test_passage, flash_options
  end

  private

  def add_gist_info(question, url)
    question.gists.new(question_id: question.id, url: url, user_id: current_user.id).save
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

