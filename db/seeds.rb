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

def delete_graduates
  Graduate.delete_all
end

def load_graduates

  FastSeeder.seed_csv!(Graduate, "Graduate.csv", :box, :lastname, :firstname, :year, :department, :deathdate, :photos, :oversize)

end

def reset_graduates
  delete_graduates
  load_graduates
end


def delete_honoraries
  Honorary.delete_all
end

def load_honoraries

  FastSeeder.seed_csv!(Honorary, "honorary.csv", :lname, :fname, :year, :death, :degree, :file)

end

def reset_honoraries
  delete_honoraries
  load_honoraries
end


def delete_memorabilia
  Memorabilium.delete_all
end

def load_memorabilia

  parsed_file = SmarterCSV.process("db/seeds/Memorabilia.csv", {:col_sep => "|", :force_simple_split => "true"})

  parsed_file.each do |value|
    Memorabilium.create(value)
  end

end

def reset_memorabilia
  delete_memorabilia
  load_memorabilia
end

def delete_faculties
  Faculty.delete_all
end

def load_faculties

  #FastSeeder.seed_csv!(Faculty, "Faculty_test.csv", :access_id,:lname,:fname,:birth,:birth_year,:death,:leave,:dept,:box,:series)
  parsed_file = SmarterCSV.process("db/seeds/Faculty_test.csv")

  parsed_file.each do |value|
    Faculty.create(value)
  end

end

def reset_faculties
  delete_faculties
  load_faculties
end

def delete_trustees_minutes
  TrusteesMinute.delete_all
end

def load_trustees_minutes

  parsed_file = SmarterCSV.process("db/seeds/TrusteesMinutes.csv", {:col_sep => "|", :force_simple_split => "true"})

  parsed_file.each do |value|
    TrusteesMinute.create(value)
  end

end

def reset_trustees_minutes
  delete_trustees_minutes
  load_trustees_minutes
end

#reset_alumni
#reset_newalumni
#reset_archboards
#reset_audiovisuals
#reset_graduates
#reset_honoraries
#reset_memorabilia
#reset_faculties
reset_trustees_minutes
