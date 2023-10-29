# app/validators/unique_email_validator.rb

class UniqueEmailValidator < ActiveModel::Validator
    def validate(record)
      if Member.exists?(email: record.email) || PendingMember.exists?(email: record.email)
        record.errors.add(:email, 'is already in use')
      end
    end
  end
  