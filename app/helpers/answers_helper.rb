module AnswersHelper
    def answer_header
        if @answer.new_record?
          render inline: '<h1>Create New <%= @question.body %> Answer</h1>'
        else
          render inline: '<h1>Edit <%= @answer.question.body %> Answer</h1>'
        end
      end
end
