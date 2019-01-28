class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  validates :title, presence: true
end
