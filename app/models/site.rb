class Site < ActiveRecord::Base
  has_many :user_sites
  has_many :users, through: :user_sites

  validates_presence_of :guid

  enum status: [:unconfirmed, :confirmed]

  scope :confirmed, -> { where(status: Site.statuses[:confirmed])}

  scope :unconfirmed, -> { where(status: Site.statuses[:unconfirmed]) }
end
