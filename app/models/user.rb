class User < ApplicationRecord
  has_and_belongs_to_many :tests, :join_table => 'users_tests'
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  def tests_by_level(value)
    tests.where(level: value)
  end

end
