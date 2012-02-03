set :stages, %w(production staging qa development)
set :default_stage, "development"
require 'capistrano/ext/multistage'

# Instruct the Capistrano to respect rvm
set :default_environment, {
  'PATH' => "/usr/local/rvm/gems/ruby-1.9.3-p0@spree/bin:/usr/local/rvm/gems/ruby-1.9.3-p0@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p0/bin:/usr/local/rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby-1.9.3-p0',
  'GEM_HOME'     => '/usr/local/rvm/gems/ruby-1.9.3-p0@spree',
  'GEM_PATH'     => '/usr/local/rvm/gems/ruby-1.9.3-p0@spree:/usr/local/rvm/gems/ruby-1.9.3-p0@global',
  'BUNDLE_PATH'  => '/usr/local/rvm/gems/ruby-1.9.3-p0@global'  
}

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

