class Attendance < ApplicationRecord
  belongs_to :member
  belongs_to :event
  validates :attended, inclusion: { in: [true, false] }
end
