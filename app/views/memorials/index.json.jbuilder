json.array!(@memorials) do |memorial|
  json.extract! memorial, :id, :publication, :volume, :no, :publish_date, :type, :subject, :class_year, :class_grade, :page
  json.url memorial_url(memorial, format: :json)
end
