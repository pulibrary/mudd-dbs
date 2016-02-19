namespace :export do
  desc "Export Alumni"
  # usage:  rake export:alumni
  task alumni: :environment do
    require 'csv'

      a = Alumn.all

      CSV.open("/tmp/alumni.csv", "a+") do |csv|
        csv << [ "id","box","lname","fname","year","graduate","photos","oversize" ]
        a.each { |row| csv << [ row.id, row.lname, row.fname, row.box, row.year, row.graduate, row.photos, row.oversize ] }
      end

  end


  desc "Export Alumni2"
  # usage: rake export:alumni2
  task alumni2: :environment do
    require 'csv'

    a = RecentAlumn.all

    CSV.open("/tmp/alumni2.csv", "a+") do |csv|
      csv << [ "id","lname","fname","year","pubfile","academicfile" ]
      a.each { |row| csv << [ row.id, row.lname, row.fname, row.year, row.pubfile, row.academicfile ] }
    end

  end

end
