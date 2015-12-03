namespace :db do
  desc 'Create fake data in the database'
  task fake: :environment do
    if rand(1..10) == 1
      dead = true
    else dead = false

         User.transaction do ## begin
           puts 'hello'
           puts Faker::Name.first_name
           num_users = 5_000
           num_users.times do
             user = User.create(
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               dob: Faker::Date.between(18.years.ago, Date.today),
               dead: dead
             )
             rand(1..3).times do
               user.jobs.create(
                 company_name: Faker::Company.name,
                 job_title: Faker::Company.profession
               )
             end
           end
         end ## end
  end
  end
end
