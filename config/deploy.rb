# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'mosh'
set :repo_url, 'git@github.com:ArmstrongStudentWorkers/mosh2.git'
set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }
set :branch, ENV['BRANCH_NAME'] || 'master'

# rbenv
set :rbenv_type, :user
set :rbenv_ruby, '1.9.3-p484'

set :deploy_to, '/var/www/mosh'

namespace :deploy do

  desc 'Configuring the database'
  after :updating, :symlink_db do
    on roles(:app) do
      execute :ln, '-s',
        release_path.join('..', '..', 'shared/database.yml'),
        release_path.join('config', 'database.yml')
    end
  end

  desc 'Configuring smtp'
  after :updating, :symlink_smtp do
    on roles(:app) do
      execute :ln, '-s',
        release_path.join('..', '..', 'shared', 'smtp_settings.rb'),
        release_path.join('config', 'initializers', 'smtp_settings.rb')
    end
  end

  desc 'Symlinking attachments'
  after :publishing, :symlink_smtp do
    on roles(:app), in: :sequence, wait: 5 do
      execute :ln, '-s',
        release_path.join('..', '..', 'shared', 'attachments'),
        release_path.join('public', 'system')
    end
  end

  desc 'Restart application'
  after :publishing, :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end
