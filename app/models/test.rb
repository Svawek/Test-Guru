class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_and_belongs_to_many :users, join_table: 'users_tests'

  scope :by_level, -> (level) {where(level: level)}
  scope :simple, -> { by_level(1..2) }
  scope :intermediate, -> { by_level(3..5) }
  scope :advanced, -> { by_level(6..Float::INFINITY) }
  scope :by_category, -> (category) {joins(:category).where(categories: { title: category })}

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: {scope: :level}

  def self.test_title
    order(title: :desc).pluck(:title)
  end
end
