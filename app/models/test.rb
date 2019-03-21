class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  scope :by_level, -> (level) {where(level: level)}
  scope :simple, -> { by_level(0..1) }
  scope :intermediate, -> { by_level(2..4) }
  scope :advanced, -> { by_level(5..Float::INFINITY) }
  scope :by_category, -> (category) {joins(:category).where(categories: { title: category })}

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: {scope: :level}

  def self.titles_by_category(category)
    by_category(category).order(title: :desc).pluck(:title)
  end
end
