module QuestionsHelper
  def question_header
    if @question.new_record?
      render inline: '<h1>Create New <%= @test.title%> Question</h1>'
    else
      render inline: '<h1>Edit <%= @question.test.title %> Question</h1>'
    end
  end
end
