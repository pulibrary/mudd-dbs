json.array!(@trustees) do |trustee|
  json.extract! trustee, :id, :access_id, :full_name, :trustee_type, :dates_of_service, :university_status, :first_year
  json.url trustee_url(trustee, format: :json)
end
