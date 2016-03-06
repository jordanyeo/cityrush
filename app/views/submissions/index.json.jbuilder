json.array!(@submissions) do |submission|
  json.extract! submission, :id, :guess, :event_id, :user_id, :clue_id, :correct
  json.url submission_url(submission, format: :json)
end
