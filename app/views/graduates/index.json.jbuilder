json.array!(@graduates) do |graduate|
  json.extract! graduate, :id, :box, :lastname, :firstname, :year, :department, :deathdate, :photos, :oversize
  json.url graduate_url(graduate, format: :json)
end
