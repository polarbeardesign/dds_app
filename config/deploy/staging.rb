# Capistrano (v2.8.0 and above) includes a recipe to handle Precompiling Assets in deployment.

load 'deploy/assets'

set :user, 'polarbea'
set :domain, 'polarbeardesign.net'

set :application, "dds_app"
set :repository,  "git@github.com:polarbeardesign/dds_app.git"
set :scm, 'git'
set :branch, "new_responsive"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache  #In most cases you want to use this option, otherwise each deploy will do a full repository clone every time.
set :ssh_options, { :forward_agent => true }
set :deploy_to, "/home/#{user}/#{application}"
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

# to overcome the "stdin: is not a tty\n" error
default_run_options[:pty] = true 

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:

# causes bundle install to run
# require "bundler/capistrano"
# set :bundle_flags, "--quiet --no-cache"

before "deploy:assets:precompile", "deploy:symlink_db_file"

after "deploy:restart", "deploy:cleanup", "deploy:symlink_env_file", "deploy:symlink_htaccess_file", "deploy:symlink_uploads"#, "deploy:precompile_other"

namespace :deploy do

   task :start do ; end
   task :stop do ; end


   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end

  desc "symlink my db file"
  task :symlink_db_file do
    run "ln -s /home/#{user}/#{application}/shared/database.yml #{latest_release}/config/database.yml"
  end

  desc "symlink my db file again"
  task :symlink_db_file_II do
    run "ln -s /home/#{user}/#{application}/shared/database.yml /home/#{user}/#{application}/current/config/database.yml"
  end

  desc "symlink my env file"
  task :symlink_env_file do
    run "ln -s /home/#{user}/#{application}/shared/production.rb /home/#{user}/#{application}/current/config/environments/production.rb"
  end

   desc "symlink the public uploads folder"
   task :symlink_uploads do
     run "ln -nfs #{shared_path}/uploads  #{release_path}/public/uploads"
   end

  desc "symlink my htaccess file"
  task :symlink_htaccess_file do
    run "ln -s /home/#{user}/#{application}/shared/.htaccess /home/#{user}/#{application}/current/public/.htaccess"
  end

  desc "precompile other"
  task :precompile_other do
    run "cd /home/#{user}/#{application}/current && bundle exec rake RAILS_ENV=production RAILS_GROUPS=assets assets:precompile"
  end

end