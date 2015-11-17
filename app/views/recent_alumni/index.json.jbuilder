json.array!(@recent_alumni) do |recent_alumn|
  json.extract! recent_alumn, :id, :lname, :fname, :year, :pubfile, :academicfile
  json.url recent_alumn_url(recent_alumn, format: :json)
end
