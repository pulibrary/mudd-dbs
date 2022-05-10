default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS", 5) %>
  timeout: 5000

development: &development
  <<: *default
  database: <%= ENV["lando_mudd_database_creds_database"] %>
  host: <%= ENV["lando_mudd_database_conn_host"] %>
  port: <%= ENV["lando_mudd_database_conn_port"] %>
  username: <%= ENV["lando_mudd_database_creds_user"] %>
  password: <%= ENV["lando_mudd_database_creds_password"] %>

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *development
  database: <%= ENV["lando_mudd_database_creds_database"] || "mudd_test" %>

production: &production
  <<: *default
  database: <%= ENV["MUDD_DB"] %>
  host: <%= ENV.fetch("MUDD_DB_HOST", "host") %>
  username: <%= ENV["MUDD_DB_USERNAME"] %>
  password: <%= ENV["MUDD_DB_PASSWORD"] %>
  port: <%= ENV['MUDD_DB_PORT'] || 3306 %>
