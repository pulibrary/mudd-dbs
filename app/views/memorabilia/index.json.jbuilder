json.array!(@memorabilia) do |memorabilium|
  json.extract! memorabilium, :id, :box, :category, :description, :classyear, :year, :reunion, :provenance
  json.url memorabilium_url(memorabilium, format: :json)
end
