json.array!(@bans) do |ban|
  json.extract! ban, :id, :user_id, :reason, :post_id, :ends_at
  json.url ban_url(ban, format: :json)
end
