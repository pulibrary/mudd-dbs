json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :access_id, :lname, :fname, :birth, :birth_year, :death, :leave, :dept, :box, :series
  json.url faculty_url(faculty, format: :json)
end
