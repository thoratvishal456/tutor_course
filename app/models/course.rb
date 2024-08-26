# course
class Course < ApplicationRecord
  has_many :tutors, dependent: :destroy
  validates :name, presence: true, uniqueness: { message: '%<value>s has already been taken' }
  accepts_nested_attributes_for :tutors
end
