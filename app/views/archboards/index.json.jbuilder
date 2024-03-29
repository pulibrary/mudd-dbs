json.array!(@archboards) do |archboard|
  json.extract! archboard, :id, :numbers_assigned, :original_assigned, :building_info_sheet, :drawing_title, :drawing_number, :project_type, :drawing_type, :board_date, :board_dimensions, :color, :drawing_view, :elevation, :comments, :contractor1_type, :contractor1_name, :contractor2_type, :contractor2_name, :contractor3_type, :contractor3_name, :proposal, :not_constructed, :bw_fiche
  json.url archboard_url(archboard, format: :json)
end
