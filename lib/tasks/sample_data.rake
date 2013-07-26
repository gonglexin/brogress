namespace :db do
  desc 'Fill database with sample data'
  task :sample_data => :environment do
    Rake::Task['db:reset'].invoke

    User.create(name: 'gonglexin',
                email: 'gonglexin@gmail.com',
                password: 'password',
                password_confirmation: 'password')

    (1..100).each do |i|
      user = User.create(name: Faker::Name.first_name,
                         email: Faker::Internet.email,
                         password: 'password',
                         password_confirmation: 'password')

      rand(0..10).times do
        item = user.items.build(title: Faker::Lorem.words(rand(1..3)).join(' ').titleize,
                                total: rand(100..400),
                                progress: rand(0..100),
                                author: Faker::Name.name, 
                                category: 'Book',
                                url: Faker::Internet.url,
                                description: Faker::Lorem.paragraph(1),
                                public: true)
        item.save
      end
    end
  end
end
