json.array!(@new_alumni) do |new_alumn|
  json.extract! new_alumn, :id, :lname, :fname, :year, :pubfile, :academicfile
  json.url new_alumn_url(new_alumn, format: :json)
end
