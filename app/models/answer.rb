class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  validate :amount_by_question_id, on: :create

  def amount_by_question_id
    errors.add(:answers_amount, "can't be more than 4") if question.answers.count >= 4
  end
end
