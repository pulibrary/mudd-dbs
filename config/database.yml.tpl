default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS", 5) %>
  timeout: 5000

development:
  <<: *default
  database: mudd_dev

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: mudd_test

production: &production
  <<: *default
  database: <%= ENV["MUDD_DB"] %>
  host: <%= ENV.fetch("MUDD_DB_HOST", "host") %>
  username: <%= ENV["MUDD_DB_USERNAME"] %>
  password: <%= ENV["MUDD_DB_PASSWORD"] %>
  port: <%= ENV['MUDD_DB_PORT'] || 3306 %>
