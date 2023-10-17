json.extract!(pending_member, :id, :first_name, :preferred_name, :last_name, :email, :created_at, 
              :updated_at
)
json.url(pending_member_url(pending_member, format: :json))
