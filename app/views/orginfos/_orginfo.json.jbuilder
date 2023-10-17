json.extract!(orginfo, :id, :title, :description, :created_at, :updated_at)
json.url(orginfo_url(orginfo, format: :json))
