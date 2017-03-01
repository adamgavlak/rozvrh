class WageCategory < ApplicationRecord
  has_many :teachers

  # Migration
  # t.string :title
  # t.float :wage_per_hour

  validates :title, presence: true
  validates :wage_per_hour, presence: true, numericality: {greater_than_or_equal_to: 0}
  
end
