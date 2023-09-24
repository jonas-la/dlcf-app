json.extract! feedback, :id, :satisfaction, :critiques, :new_ideas, :member_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
