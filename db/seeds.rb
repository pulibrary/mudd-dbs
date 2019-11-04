# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeding from CSV file placed in the db/seeds directory:
def delete_alumni
  puts "deleting alumni..."
  Alumn.delete_all
end

def load_alumni
  print "loading alumni..."
  # FastSeeder.seed_csv!(Alumn, "ALUMNI.csv", :box, :lname, :fname, :year, :graduate, :photos, :oversize)
  import_csv(class_name: Alumn, csv_file: "ALUMNI.csv", headers: [:box, :lname, :fname, :year, :graduate, :photos, :oversize])
end

def reset_alumni
  delete_alumni
  load_alumni
  puts "!"
  puts "alumni loaded!"
end

def import_csv(class_name:, csv_file:, headers:, col_sep: ',', quote_char: '"' )
  list = []
  CSV.foreach(Rails.root.join('db','seeds',csv_file), headers: headers, col_sep: col_sep, quote_char: quote_char) do |row|
    hash = row.to_h
    hash.delete(nil)
    list << class_name.new(hash)
  end
  class_name.import list
end

def delete_newalumni
  puts "deleting recent_alumni..."
  RecentAlumn.delete_all
end
def load_newalumni
  print "loading recent_alumni..."
  import_csv(class_name: RecentAlumn, csv_file: "Alumni2-update.csv", headers: [:lname, :fname, :year, :pubfile, :academicfile])
end

def reset_newalumni
  delete_newalumni
  load_newalumni
  puts "!"
  puts "recentalumni loaded!"
end

def delete_archboards
  puts "deleting archboards..."
  Archboard.delete_all
end

def load_archboards
  print "loading archboards..."
  import_csv(class_name: Archboard, csv_file: "Archboards.csv", headers: [:numbers_assigned, :original_assigned, :building_info_sheet, :drawing_title, :drawing_number, :project_type, :drawing_type, :board_date, :board_dimensions, :color, :drawing_view, :elevation, :comments, :contractor1_type, :contractor1_name, :contractor2_type, :contractor2_name, :contractor3_type, :contractor3_name, :proposal, :not_constructed, :bw_fiche])
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
  import_csv(class_name: AudioVisual, csv_file: "AudioVisuals.csv", headers: true, col_sep: '|', quote_char: "^") #putting quote_char to a value not in the file so quotes in the file will be passed through

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
  import_csv(class_name: Graduate, csv_file: "Graduate.csv", headers: [:box, :lastname, :firstname, :year, :department, :deathdate, :photos, :oversize])
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
  import_csv(class_name: Honorary, csv_file: "honorary.csv", headers: [:lname, :fname, :year, :death, :degree, :file])

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
  import_csv(class_name: Memorabilium, csv_file: "Memorabilia.csv", headers: true, col_sep: '|', quote_char: "^")
end

def reset_memorabilia
  delete_memorabilia
  load_memorabilia
  puts "!"
  puts "memorabilia loaded!"
end

def delete_faculties
  print "deleting faculty..."
  Faculty.delete_all
end

def load_faculties
  import_csv(class_name: Faculty, csv_file: "Faculty.csv", headers: [:access_id,:lname,:fname,:birth,:birth_year,:death,:leave,:dept,:box,:series])
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
  import_csv(class_name: TrusteesMinute, csv_file: "TrusteesMinutes.csv", headers: true, col_sep: '|', quote_char: "^")
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
  import_csv(class_name: NassauLiterature, csv_file: "NASSLIT.csv", headers: true, col_sep: '|', quote_char: "^")
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
  import_csv(class_name: Memorial, csv_file: "PAW.csv", headers: true)
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
  import_csv(class_name: Trustee, csv_file: "TrusteesList.csv", headers: true)
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
  import_csv(class_name: WwiiMemorial, csv_file: "WarBook.csv", headers: true, col_sep: '|', quote_char: "^")
end

def reset_wwii_memorials
  delete_wwii_memorials
  load_wwii_memorials
  puts "!"
  puts "wwii_memorials loaded!"
end

def delete_photos
  puts "deleting photos..."
  Photo.delete_all
end

def load_photos
  print "loading photos..."
  import_csv(class_name: Photo, csv_file: "HPC-20k.csv", headers: true)
end

def reset_photos
  delete_photos
  load_photos
  puts "!"
  puts "photos loaded!"
end

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
