# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w(PENDING APPROVED DENIED), message: "%{value} is not a valid status" }

  validate :overlapping_approved_requests

  belongs_to :cat

  def overlapping_approved_requests
    if overlapping_requests.any? { |request| request.status == "APPROVED" }
      errors.add(:cat_request, "cannot be overlapping")
    end
  end

  def overlapping_requests
    requests_for_same_cat = CatRentalRequest.where("cat_id = ?", self.cat_id)
    requests_for_same_cat.select{ |request| overlaps?(request) && request.id != self.id }
  end

  def overlaps?(other)
    (self.start_date - other.end_date) * (other.start_date - self.end_date) >= 0
  end
end
