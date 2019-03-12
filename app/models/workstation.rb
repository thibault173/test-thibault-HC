class Workstation < ApplicationRecord
  has_many :requests
  validates :name, presence: true
end
