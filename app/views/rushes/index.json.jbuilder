json.array!(@rushes) do |rush|
  json.extract! rush, :id, :name, :scheduled_at
  json.url rush_url(rush, format: :json)
end
