json.array!(@clues) do |clue|
  json.extract! clue, :id, :location_id, :description, :lat, :long
  json.url clue_url(clue, format: :json)
end
