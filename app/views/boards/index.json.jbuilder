json.array!(@boards) do |board|
  json.extract! board, :id, :url, :name, :description, :nsfw, :visible
  json.url board_url(board, format: :json)
end
