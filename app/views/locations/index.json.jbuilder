json.array!(@locations) do |location|
  json.extract! location, :id, :rush_id, :name, :description, :lat, :long
  json.url location_url(location, format: :json)
end
