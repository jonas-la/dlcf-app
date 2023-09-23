json.extract! member, :id, :first_name, :preferred_name, :last_name, :email, :is_member, :is_admin, :bio, :contact, :photo_file_name, :role, :created_at, :updated_at
json.url member_url(member, format: :json)
