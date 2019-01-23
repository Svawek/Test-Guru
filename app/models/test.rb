class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, :class_name => 'User', foreign_key: 'author_id'
  has_many :questions
  has_and_belongs_to_many :users, :join_table => 'users_tests'

  def self.by_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
