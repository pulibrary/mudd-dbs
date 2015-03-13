# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeding from CSV file placed in the db/seeds directory:

def delete_alumni
  Alumn.delete_all
end

def load_alumni
  FastSeeder.seed_csv!(Alumn, "ALUMNI.csv", :box, :lname, :fname, :year, :graduate, :photos, :oversize)
end

def reset_alumni
  delete_alumni
  load_alumni
end

def delete_newalumni
  NewAlumn.delete_all
end

def load_newalumni
  FastSeeder.seed_csv!(NewAlumn, "Alumni2.csv", :lname, :fname, :year, :pubfile, :academicfile)
end

def reset_newalumni
  delete_newalumni
  load_newalumni
end

def delete_archboards
  Archboard.delete_all
end

def load_archboards
  FastSeeder.seed_csv!(Archboard, "Archboards.csv", :numbers_assigned, :original_assigned, :building_info_sheet, :drawing_title, :drawing_number, :project_type, :drawing_type, :board_date, :board_dimensions, :color, :drawing_view, :elevation, :comments, :contractor1_type, :contractor1_name, :contractor2_type, :contractor2_name, :contractor3_type, :contractor3_name, :proposal, :not_constructed, :bw_fiche)
end

def reset_archboards
  delete_archboards
  load_archboards
end

def delete_audiovisuals
  Archboard.delete_all
end

def load_audiovisuals

  parsed_file = SmarterCSV.process("db/seeds/AudioVisuals.csv", {:col_sep => "|", :force_simple_split => "true"}) 

  parsed_file.each do |value|
    AudioVisual.create(value)
  end

end

def reset_audiovisuals
  delete_audiovisuals
  load_audiovisuals
end

#reset_alumni
#reset_newalumni
#reset_archboards
reset_audiovisuals