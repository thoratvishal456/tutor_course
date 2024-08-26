# Tutor
class Tutor < ApplicationRecord
  belongs_to :course
  validates :name, :email, presence: true
  validates :email, presence: true, uniqueness: { message: '%{value} has already been taken' }
end
