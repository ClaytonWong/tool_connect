class Profile < ApplicationRecord
  belongs_to :user

  validates :username, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :date_of_birth, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :postcode, presence: true
  validates :suburb, presence: true
  validates :street_address, presence: true
  validates :ph_num, presence: true
  validates :mob_num, presence: true

  def completed_profile?
    self.username.present? && self.family_name.present? && self.first_name.present?  && self.date_of_birth.present? && self.country.present? && self.state.present? && self.postcode.present? && self.suburb.present? && self.street_address.present? && self.ph_num.present? && self.mob_num.present?
  end
end
