require 'faker'

namespace :db do
  desc 'Fill database with sample data'
  task :sample_data => :environment do
    Rake::Task['db:reset'].invoke

    User.create(name: 'gonglexin',
                email: 'gonglexin@gmail.com',
                password: 'password',
                password_confirmation: 'password')

    User.create(name: 'admin',
                email: 'admin@example.com',
                password: 'password',
                password_confirmation: 'password')

    100.times do |i|
      Item.create(title:       Faker::Lorem.words(rand(1..3)).join(' ').titleize,
                  total:       rand(20..1000),
                  author:      Faker::Name.name, 
                  category:    'Book',
                  url:         Faker::Internet.url,
                  description: Faker::Lorem.paragraph(1),
                  user_id:     (i % 2) + 1)
    end
  end
end
