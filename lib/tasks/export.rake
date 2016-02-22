namespace :export do
  desc "Export Alumni"
  # usage:  rake export:alumni
  task alumni: :environment do
    require 'csv'

      CSV.open("/tmp/alumni.csv", "w+", {:col_sep => "|"}) do |csv|
        csv << [ "id","box","lname","fname","year","graduate","photos","oversize" ]
        Alumn.find_each { |row| csv << [ row.id, row.lname, row.fname, row.box, row.year, row.graduate, row.photos, row.oversize ] }
      end

  end


  desc "Export Alumni2"
  # usage: rake export:alumni2
  task alumni2: :environment do
    require 'csv'

    CSV.open("/tmp/alumni2.csv", "w+", {:col_sep => "|"}) do |csv|
      csv << [ "id","lname","fname","year","pubfile","academicfile" ]
      RecentAlumn.find_each { |row| csv << [ row.id, row.lname, row.fname, row.year, row.pubfile, row.academicfile ] }
    end

  end

  desc "Export Graduate Alumni"
  # usage: rake export:graduates
  task graduates: :environment do
    require 'csv'

    CSV.open("/tmp/graduates.csv", "w+", {:col_sep => "|"}) do |csv|
      csv << [ "id","box","lastname","firstname","year","department","deathdate","photos","oversize" ]
      Graduate.find_each { |row| csv << [ row.id, row.box, row.lastname, row.firstname, row.year, row.department, row.deathdate, row.photos, row.oversize ] }
    end

  end

  desc "Export Faculty"
  # usage: rake export:faculty
  task faculty: :environment do
    require 'csv'

    CSV.open("/tmp/faculty.csv", "w+", {:col_sep => "|"}) do |csv|
      csv << [ "id","access_id","lname","fname","birth","birth year","death","leave","dept","box","series" ]
      Faculty.find_each { |row| csv << [ row.id, row.access_id,row.lname,row.fname,row.birth,row.birth_year,row.death,row.leave,row.dept,row.box,row.series ] }
    end

  end


end
