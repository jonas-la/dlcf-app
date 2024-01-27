# app/validators/unique_email_validator.rb
# added validator for account creation
# will check the pending members table 
# and the members table
# Validator only added to the 
# pending_members creation form

class UniqueEmailValidator < ActiveModel::Validator
  def validate(record)
    if Member.exists?(email: record.email) || PendingMember.exists?(email: record.email)
      record.errors.add(:email, 'is already in use')
    end
  end
end
  