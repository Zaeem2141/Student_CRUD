class Student < ApplicationRecord

  has_many :subjects

  validates :name, presence: true
  validates :roll, presence: true
end
