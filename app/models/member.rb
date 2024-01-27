class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  has_many :feedbacks, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances

  before_destroy :prevent_deletion

  private

  def set_default_role
    self.role ||= "Member"
  end

  def prevent_deletion
    # prevent deletion of super officer
    # This is done for security / ensure that account won
    if email == "dclftest@gmail.com" || email == "dlcftest@gmail.com"
      errors.add(:base, "This member cannot be deleted.")
      throw(:abort)
    end
  end
end
