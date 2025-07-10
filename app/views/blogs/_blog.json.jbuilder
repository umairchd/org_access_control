json.extract! blog, :id, :title, :body, :age_group, :created_at, :updated_at
json.url blog_url(blog, format: :json)
