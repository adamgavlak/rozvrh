class WageCategory < ApplicationRecord
  has_many :teachers

  # Migration
  # t.string :title
  # t.float :wage_per_hour

  validates :title, presence: true
  validates :wage_per_hour, presence: true
  
end
