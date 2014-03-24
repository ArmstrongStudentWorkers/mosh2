namespace :test_data do
  desc 'Load example users'
  task :from_csv => :environment do |t, args|

    puts 'Deleting all Users.'
    User.delete_all
    puts 'Creating sample Users.'

    def make_user_from_file(file)
      require 'csv'
      puts "creating users from #{file}"
      CSV.foreach(file) do |row|
        name = row[0].strip
        email = row[1].strip
        admin = row[3].strip
        management = row[2].strip
        noncsit = row[4].strip
        student = row[5].strip

        if !User.find_by_email(email)
          create_user(name, email, management, admin, noncsit, student)
        else
          puts "User already exists: #{name}"
        end
      end
    end

    def create_user(name, email, management, admin, noncsit, student)
      password = Devise.friendly_token.first(8)
      puts "email: #{email}, admin: #{admin}, management: #{management}, noncsit: #{noncsit}, student: #{student}"
      new_user = User.create(email: email, name: name, password: password, password_confirmation: password, admin: admin, management: management, noncsit: noncsit, student: student)
      puts "Created User: #{name}"
      if new_user.save!
        new_user.send_reset_password_instructions
      else
        puts "Could not save user."
      end
    end

    make_user_from_file("#{Rails.root}/lib/assets/fake_users.csv")

  end
end
