class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :badge_gettings

  before_validation :before_validation_set_next_question

  PASSING_SCORE = 85


  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def result_percent
    (correct_questions / test.questions.count * 100).round(2)
  end

  def passed?
    result_percent >= PASSING_SCORE
  end

  def show_progress
    test.questions.index(current_question) + 1
  end

  def show_questions_amount
    test.questions.count
  end

  private

  def before_validation_set_next_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count
    (correct_answer_count == correct_answer.where(id: answer_ids).count) &&
    correct_answer_count == answer_ids.count
  end

  def correct_answer
    current_question.answers.correct
  end
end
