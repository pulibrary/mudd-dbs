# config valid only for current version of Capistrano

set :application, 'mudd'
set :repo_url, 'git@github.com:pulibrary/mudd-dbs.git'
set :branch, 'master'

# Default branch is :master
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/opt/mudd-dbs'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

shared_path = "#{:deploy_to}/shared"

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/initializers/secret_token.rb')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'db/seeds')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :mudd do
  desc "Upload the seed file"
  task :upload_seeds, [:seed_tar_gz] do |_t, args|
    seed_tar_gz = args[:seed_tar_gz]
    seed_tar = seed_tar_gz.sub('.gz','')
    on roles(:app) do |host|
      upload! File.join('./', seed_tar_gz), "/tmp/#{seed_tar_gz}"
      execute "gzip -d -f /tmp/#{seed_tar_gz}"
      with :rails_env => fetch(:rails_env) do
        execute "cd #{current_path}; mkdir -p db/seeds"
        execute "cd #{current_path}/db/seeds/; tar -xvf /tmp/#{seed_tar} "
        execute "cd #{current_path}; bundle exec rake db:seed"
      end
    end
  end
end
namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # desc "reload the database with data"
	  #task :seed do
	  #  run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
	  #end
    end
  end

end
