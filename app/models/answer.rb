class Answer < ApplicationRecord
  belongs_to :users
  belongs_to :questions
end
