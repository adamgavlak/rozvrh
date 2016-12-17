class Group < ApplicationRecord
    has_many :group_courses
    has_many :courses, through: :group_courses
end
