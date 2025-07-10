class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships
  has_many :organizations, through: :memberships

  def age
    return unless date_of_birth
    now = Time.zone.now.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end

  def age_group
    return unless age

    case age
    when 0..12 then :child
    when 13.. then :adult
    else :everyone
    end
  end

  def underage?
    age && age < 13
  end

  def needs_parental_consent?
    underage? && !parental_consent?
  end
end
