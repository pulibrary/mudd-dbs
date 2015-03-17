json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :id, :lname, :fname, :birth, :birth, :year, :death, :leave, :dept, :box, :series
  json.url faculty_url(faculty, format: :json)
end
