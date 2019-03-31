class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  EMAIL_FORMAT = /\w+@{1}\w+\.{1}\D+/.freeze

  validates :name, presence: true
  validates_format_of :email, with: EMAIL_FORMAT

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
