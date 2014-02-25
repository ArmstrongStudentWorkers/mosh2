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
        admin = row[2].strip
        management = row[3].strip
        noncsit = row[4].strip

        if !User.find_by_email(email)
          create_user(name, email, admin, management, noncsit)
        else
          puts "User already exists: #{name}"
        end
      end
    end

    def create_user(name, email, admin, management, noncsit)
      password = Devise.friendly_token.first(8)
      #token = User.reset_password_token
      puts "email: #{email}, admin: #{admin}, management: #{management}, noncsit: #{noncsit}"
      if new_user = User.create({email: email, name: name, password: password, password_confirmation: password, admin: admin, management: management, noncsit: noncsit})
        puts "Created User: #{name}"
        #new_user.reset_password_token = token
        #new_user.reset_password_sent_at = DateTime.now
        if new_user.save!
          #puts "Sending welcome email."
          #UserMailer.welcome_email(new_user).deliver
          new_user.send_reset_password_instructions
        else
          puts "Could not save user with reset password token."
        end
      else
        puts "Could not create user."
      end
    end

    make_user_from_file("#{Rails.root}/lib/tasks/fake_users.csv")

  end
end
