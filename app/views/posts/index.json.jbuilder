json.array!(@posts) do |post|
  json.extract! post, :id, :topic_id, :content, :user_id, :show_name, :author
  json.url post_url(post, format: :json)
end
