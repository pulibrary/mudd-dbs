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
  FastSeeder.seed_csv!(Alumn, "ALUMNI.csv", :box, :fname, :lname, :year, :graduate, :photos, :oversize)
end

def reset_alumni
  delete_alumni
  load_alumni
end

reset_alumni