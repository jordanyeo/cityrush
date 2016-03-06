json.array!(@clues) do |clue|
  json.extract! clue, :id, :title, :description, :answer, :event_id
  json.url clue_url(clue, format: :json)
end
