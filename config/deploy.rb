# config valid only for current version of Capistrano

set :application, 'mudd'
set :repo_url, 'https://github.com/pulibrary/mudd-dbs.git'
set :branch, 'main'

# Default branch is :main
set :branch, ENV["BRANCH"] || "main"

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
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'db/seeds')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # desc "reload the database with data"
	  #task :seed do
	  #  run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
	  #end
    end
  end

  desc "Place assets at the top level so that they can be access by the server as well as the proxied server" 
  task :local_assets do
    on roles(:web) do
      within release_path do
        execute "pwd"
        execute :rake, "assets:precompile ASSET_PREFIX=/assets"
      end
    end
  end

  after "deploy:assets:precompile", "deploy:local_assets"

end
