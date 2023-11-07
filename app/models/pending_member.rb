class PendingMember < ApplicationRecord
    validates_with UniqueEmailValidator
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: Devise.email_regexp }
end
