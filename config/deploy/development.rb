set :application, "spree"
set :repository,  "git@github.com:eraserx99/spree-demo.git"
set :deploy_to, "/var/www/#{application}"
set :rails_env, "development"
set :user, "vagrant"
set :group, "vagrant"
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_command, "/usr/bin/git"
set :branch, "master"
set :deploy_via, :remote_cache

role :web, "spree"                   # Your HTTP server, Apache/etc
role :app, "spree"                   # This may be the same as your `Web` server
role :db,  "spree", :primary => true # This is where Rails migrations will run
