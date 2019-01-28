class Category < ApplicationRecord
  default_scope { order(title: :asc) }
end
