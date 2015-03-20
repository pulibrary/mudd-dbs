json.array!(@wwii_memorials) do |wwii_memorial|
  json.extract! wwii_memorial, :id, :access_id, :rank, :name, :death_date, :place, :year, :death_year, :last_name
  json.url wwii_memorial_url(wwii_memorial, format: :json)
end
