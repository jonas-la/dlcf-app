class Event < ApplicationRecord
  validates :event_name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :password, presence: true
  has_many :attendances, dependent: :destroy
  has_many :members, through: :attendances
  
  # Custom validation to check if start_time is before end_time
  validate :start_time_before_end_time

  def start_time_before_end_time
    if start_time.present? && end_time.present? && start_time >= end_time
      errors.add(:start_time, "must be before the end time")
    end
  end

end
