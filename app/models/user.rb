class User < ApplicationRecord
  has_and_belongs_to_many :tests, :join_table => 'users_tests'
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  def by_tests(value)
    Test.joins("JOIN opened_tests ON tests.id = opened_tests.test_id").where(opened_tests: { user_id: id }).where(level: value)
  end

end
