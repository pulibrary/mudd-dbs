mudd-dbs
========

Mudd Databases App upgrade/migration to Rails

Make sure csv files are in db/seeds and run ```rake db:seed``` to populate database

When deploying to production (cap production deploy), use ```bundle exec rake db:seed RAILS_ENV="production"```

