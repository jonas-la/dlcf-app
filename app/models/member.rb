class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  has_many :feedbacks, dependent: :destroy
  has_many :attendances, dependent: :destroy

  private

  def set_default_role
    self.role ||= "Member"
  end

end
