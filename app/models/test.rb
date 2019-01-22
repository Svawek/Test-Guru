class Test < ApplicationRecord
  belongs_to :category

  def self.by_category(category)
    joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
