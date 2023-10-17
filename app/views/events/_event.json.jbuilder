json.extract!(event, :id, :event_name, :location, :start_time, :end_time, :description, 
              :created_at, :updated_at
)
json.url(event_url(event, format: :json))
