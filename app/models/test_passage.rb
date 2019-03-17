class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_correct_answers, on: :create
  before_validation :before_validation_set_questions_amount, on: :create
  before_validation :before_validation_set_current_question_number, on: :create
  before_update :before_update_next_question, on: :update

  PASSING_SCORE = 85.freeze

  @@correct_test_answers = 0
  @@questions_amount = 0
  @@current_question_number = 0

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    @@current_question_number += 1
    save!
  end

  def completed?
    current_question.nil?
  end

  def result_percent
    (correct_questions / @@correct_test_answers * 100).round(2)
  end

  def passed?
    result_percent >= PASSING_SCORE
  end

  def show_progress
    @@current_question_number
  end

  def show_questions_amount
    @@questions_amount
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_correct_answers
    @@correct_test_answers = 0
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count
    @@correct_test_answers += correct_answer_count
    (correct_answer_count == correct_answer.where(id: answer_ids).count) &&
    correct_answer_count == answer_ids.count
  end

  def correct_answer
    current_question.answers.correct
  end

  def before_update_next_question
    fol_question = test.questions.order(:id).where('id > ?', current_question.id).first
    self.current_question = fol_question
  end

  def before_validation_set_questions_amount
    @@questions_amount = test.questions.count
  end

  def before_validation_set_current_question_number
    @@current_question_number = 1
  end
end
