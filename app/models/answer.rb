class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  validate :amount_by_question_id

  def amount_by_question_id
    answers = Answer.where(question_id: self.question_id).count
    errors.add(:answers_amount, "can't be more than 4") if answers > 3
  end
end
