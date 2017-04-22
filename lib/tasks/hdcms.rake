namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app job-crm-v1 --confirm job-crm-v1
      heroku run rake db:migrate --app job-crm-v1
      heroku run rake db:seed --app job-crm-v1')
  end
end
