class Badge < ApplicationRecord
  has_many :badge_gettings
  has_many :users, through: :badge_gettings

  ACCEPTABLE_CATEGORY = %w(category test level)
  ACCEPTABLE_CONDITION = %w(pass pass_all first_time)
  ACCEPTABLE_LEVEL = %w(simple intermediate advanced)

  validates :name, presence: true
  validates :image, presence: true
  validates :category, inclusion: { in: ACCEPTABLE_CATEGORY }
  validates :condition, inclusion: { in: ACCEPTABLE_CONDITION }

end
