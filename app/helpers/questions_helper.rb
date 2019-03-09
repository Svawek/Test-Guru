module QuestionsHelper
  def question_header
    if request.filtered_parameters[:action] == 'new'
      render inline: '<h1>Create New <%= @test.title%> Question</h1>'
    else
      render inline: '<h1>Edit <%= @t.title %> Question</h1>'
    end
  end
end
