json.extract!(attendance, :id, :member_id, :event_id, :attended, :created_at, :updated_at)
json.url(attendance_url(attendance, format: :json))
