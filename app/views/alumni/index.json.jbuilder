json.array!(@alumni) do |alumn|
  json.extract! alumn, :id, :box, :lname, :fname, :class, :graduate, :photos, :oversize
  json.url alumn_url(alumn, format: :json)
end
