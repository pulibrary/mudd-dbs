json.array!(@trustees_minutes) do |trustees_minute|
  json.extract! trustees_minute, :id, :access_id, :subject, :volume, :page
  json.url trustees_minute_url(trustees_minute, format: :json)
end
