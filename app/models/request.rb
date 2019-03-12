class Request < ApplicationRecord
  belongs_to :user
  belongs_to :workstation

  validates :status, inclusion: REQUEST_STATES
end
