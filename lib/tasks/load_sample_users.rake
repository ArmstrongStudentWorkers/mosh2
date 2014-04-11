namespace :test_data do
  desc 'Load example users'
  task :users => :environment do

    puts 'Deleting all Users.'
    User.delete_all
    puts 'Creating sample Users.'

    def make_user(email, name, management, admin, noncsit, student, faculty)
      password = 'password'
      User.create!(email: email, password: password, password_confirmation: password, name: name, management: management, admin: admin, noncsit: noncsit, student: student, faculty: faculty)
      puts "Created User: #{name}"
    end

    make_user('management@email.com', 'Management', true, false, false, false, false)
    make_user('admin@email.com', 'Admin', true, true, false, false, false)
    make_user('noncsit@email.com', 'Noncsit', false, false, true, false, false)
    make_user('faculty@email.com', 'Faculty', false, false, false, false, true)
    make_user('student@email.com', 'Student', false, false, false, true, false)
  end
end
