# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeding from CSV file placed in the db/seeds directory:
=begin
def delete_alumni
  puts "deleting alumni..."
  Alumn.delete_all
end

def load_alumni
  print "loading alumni..."
  FastSeeder.seed_csv!(Alumn, "ALUMNI.csv", :box, :lname, :fname, :year, :graduate, :photos, :oversize)
end

def reset_alumni
  delete_alumni
  load_alumni
  puts "!"
  puts "alumni loaded!"
end
=end
def delete_newalumni
  puts "deleting recent_alumni..."
  RecentAlumn.delete_all
end

def load_newalumni
  print "loading recent_alumni..."
  FastSeeder.seed_csv!(RecentAlumn, "Alumni2-update.csv", :lname, :fname, :year, :pubfile, :academicfile)
end

def reset_newalumni
  delete_newalumni
  load_newalumni
  puts "!"
  puts "recentalumni loaded!"
end
=begin
def delete_archboards
  puts "deleting archboards..."
  Archboard.delete_all
end

def load_archboards
  print "loading archboards..."
  FastSeeder.seed_csv!(Archboard, "Archboards.csv", :numbers_assigned, :original_assigned, :building_info_sheet, :drawing_title, :drawing_number, :project_type, :drawing_type, :board_date, :board_dimensions, :color, :drawing_view, :elevation, :comments, :contractor1_type, :contractor1_name, :contractor2_type, :contractor2_name, :contractor3_type, :contractor3_name, :proposal, :not_constructed, :bw_fiche)
end

def reset_archboards
  delete_archboards
  load_archboards
  puts "!"
  puts "archboards loaded!"
end

def delete_audiovisuals
  puts "deleting audiovisuals..."
  AudioVisual.delete_all
end

def load_audiovisuals
  print "loading audiovisuals..."
  parsed_file = SmarterCSV.process("db/seeds/AudioVisuals.csv", {:col_sep => "|", :force_simple_split => "true"})

  parsed_file.each do |value|
    print "."
    AudioVisual.create(value)
  end

end

def reset_audiovisuals
  delete_audiovisuals
  load_audiovisuals
  puts "!"
  puts "audiovisuals loaded!"
end

def delete_graduates
  puts "deleting graduates..."
  Graduate.delete_all
end

def load_graduates
  print "loading graduates..."
  FastSeeder.seed_csv!(Graduate, "Graduate.csv", :box, :lastname, :firstname, :year, :department, :deathdate, :photos, :oversize)

end

def reset_graduates
  delete_graduates
  load_graduates
  puts "!"
  puts "graduates loaded!"
end


def delete_honoraries
  puts "deleting honoraries..."
  Honorary.delete_all
end

def load_honoraries
  print "loading honoraries..."
  FastSeeder.seed_csv!(Honorary, "honorary.csv", :lname, :fname, :year, :death, :degree, :file)

end

def reset_honoraries
  delete_honoraries
  load_honoraries
  puts "!"
  puts "honoraries loaded!"
end


def delete_memorabilia
  puts "deleting memorabilia..."
  Memorabilium.delete_all
end

def load_memorabilia
  print "loading memorabilia..."
  parsed_file = SmarterCSV.process("db/seeds/Memorabilia.csv", {:col_sep => "|", :force_simple_split => "true"})

  parsed_file.each do |value|
    print "."
    Memorabilium.create(value)
  end

end

def reset_memorabilia
  delete_memorabilia
  load_memorabilia
  puts "!"
  puts "memorabilia loaded!"
end

def delete_faculties
  puts "deleting faculty..."
  Faculty.delete_all
end

def load_faculties
  print "loading faculty..."
  #FastSeeder.seed_csv!(Faculty, "Faculty_test.csv", :access_id,:lname,:fname,:birth,:birth_year,:death,:leave,:dept,:box,:series)
  parsed_file = SmarterCSV.process("db/seeds/Faculty.csv")

  parsed_file.each do |value|
    print "."
    Faculty.create(value)
  end

end

def reset_faculties
  delete_faculties
  load_faculties
  puts "!"
  puts "faculty loaded!"
end

def delete_trustees_minutes
  puts "deleting trustees_minutes..."
  TrusteesMinute.delete_all
end

def load_trustees_minutes
  print "loading trustees_minutes..."
  parsed_file = SmarterCSV.process("db/seeds/TrusteesMinutes.csv", {:col_sep => "|", :force_simple_split => "true"})

  parsed_file.each do |value|
    print "."
    TrusteesMinute.create(value)
  end

end

def reset_trustees_minutes
  delete_trustees_minutes
  load_trustees_minutes
  puts "!"
  puts "trustees_minutes loaded!"
end


def delete_nassau_literatures
  puts "deleting nassau_literatures..."
  NassauLiterature.delete_all
end

def load_nassau_literatures
  print "loading nassau_literatures..."
  parsed_file = SmarterCSV.process("db/seeds/NASSLIT.csv", {:col_sep => "|", :force_simple_split => "true"})

  parsed_file.each do |value|
    print "."
    NassauLiterature.create(value)
  end

end

def reset_nassau_literatures
  delete_nassau_literatures
  load_nassau_literatures
  puts "!"
  puts "nassau_literatures loaded!"
end

def delete_memorials
  Memorial.delete_all
  puts "deleting memorials..."
end

def load_memorials
  print "loading memorials..."
  #FastSeeder.seed_csv!(Memorial, "PAW.csv", :publication :volume :no :publish_date :type :subject :class_year :class_grade :page)

  parsed_file = SmarterCSV.process("db/seeds/PAW.csv")

  parsed_file.each do |value|
    print "."
    Memorial.create(value)
  end

end

def reset_memorials
  delete_memorials
  load_memorials
  puts "!"
  puts "memorials loaded!"
end

def delete_trustees
  puts "deleting trustees..."
  Trustee.delete_all
end

def load_trustees
  print "loading trustees..."
  parsed_file = SmarterCSV.process("db/seeds/TrusteesList.csv")

  parsed_file.each do |value|
    print "."
    Trustee.create(value)
  end

end

def reset_trustees
  delete_trustees
  load_trustees
  puts "!"
  puts "trustees loaded!"
end

def delete_wwii_memorials
  puts "deleting wwii_memorials..."
  WwiiMemorial.delete_all
end

def load_wwii_memorials
  print "loading wwii_memorials..."
  parsed_file = SmarterCSV.process("db/seeds/WarBook.csv", {:col_sep => "|", :force_simple_split => "true"})

  parsed_file.each do |value|
    print "."
    WwiiMemorial.create(value)
  end

end

def reset_wwii_memorials
  delete_wwii_memorials
  load_wwii_memorials
  puts "!"
  puts "wwii_memorials loaded!"
end
=end

def delete_photos
  puts "deleting photos..."
  Photo.delete_all
end

def load_photos
  print "loading photos..."
  parsed_file = SmarterCSV.process("db/seeds/HPC-20k.csv", {:col_sep => ","})

  parsed_file.each do |value|
    print "."
    Photo.create(value)
  end
end

def reset_photos
  delete_photos
  load_photos
  puts "!"
  puts "photos loaded!"
end

=begin
reset_alumni
reset_newalumni
reset_archboards
reset_audiovisuals
reset_graduates
reset_honoraries
reset_memorabilia
reset_faculties
reset_trustees_minutes
reset_nassau_literatures
reset_memorials
reset_trustees
reset_wwii_memorials
reset_photos
=end

load_newalumni
