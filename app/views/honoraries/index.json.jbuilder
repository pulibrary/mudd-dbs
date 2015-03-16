json.array!(@honoraries) do |honorary|
  json.extract! honorary, :id, :lname, :fname, :year, :death, :degree, :file
  json.url honorary_url(honorary, format: :json)
end
