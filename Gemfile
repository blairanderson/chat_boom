ruby '2.1.2'
source 'https://rubygems.org'


gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise', github: 'plataformatec/devise'
gem 'simple_form'
gem 'delayed_job_active_record'
gem 'binding_of_caller'
gem 'bootstrap-sass', github: 'twbs/bootstrap-sass'
gem 'bootstrap-sass-extras'
gem 'validates_formatting_of'
gem 'tzinfo-data'
gem 'keen'

group :production do
  gem 'rails_12factor'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-rails'
  gem 'better_errors'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'codeclimate-test-reporter', require: nil
end