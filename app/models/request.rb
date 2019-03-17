class Request < ApplicationRecord
  belongs_to :user
  belongs_to :workstation

  validates :status, inclusion: REQUEST_STATES

  scope :unconfirmed, -> { where(user: User.where(confirmed_at: nil)) }

  scope :confirmed, -> { where.not(user: User.where(confirmed_at: nil)).where(status: "pending") }

  scope :accepted, -> { where(status: "accepted") }

  scope :expired, -> { where(status: "expired") }

  def accept!
    return unless status == "pending"
    return if user.confirmed_at.nil?

    self.status = "accepted"
    self.signature_date = Date.today
    save!
  end
end
