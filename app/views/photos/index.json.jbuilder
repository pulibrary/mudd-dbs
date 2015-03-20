json.array!(@photos) do |photo|
  json.extract! photo, :id, :image_num, :box, :item_num, :accession_num, :e_num, :negative_num, :image_type, :provenance, :photographer, :date_taken, :division, :subseries, :general_sub, :specific_sub, :publication, :notes, :online_image
  json.url photo_url(photo, format: :json)
end
