class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  enum role: { member: 'member', manager: 'manager', admin: 'admin' }

  validates :role, presence: true
end
