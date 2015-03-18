json.array!(@nassau_literatures) do |nassau_literature|
  json.extract! nassau_literature, :id, :lname, :fname, :classyear, :title, :date, :issue_no, :pages
  json.url nassau_literature_url(nassau_literature, format: :json)
end
