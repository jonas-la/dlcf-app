class Attendance < ApplicationRecord
  validates :attended, presence: true
  belongs_to :member
  belongs_to :event
end
