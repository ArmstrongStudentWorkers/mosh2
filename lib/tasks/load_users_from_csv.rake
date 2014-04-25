namespace :db do
  desc 'Load users from a CSV'
  task :load_users_from_csv => :environment do |t, args|

    def make_user_from_file(file)
      require 'csv'
      puts "Creating users from #{file}"
      CSV.foreach(file) do |row|
        name = row[0].strip
        email = row[1].strip
        management = row[2].strip
        admin = row[3].strip
        noncsit = row[4].strip
        student = row[5].strip
        faculty = row[6].strip

        if !User.find_by_email(email)
          create_user(name, email, management, admin, noncsit, student, faculty)
        else
          puts "User already exists: #{name}"
        end
      end
    end

    def create_user(name, email, management, admin, noncsit, student, faculty)
      password = Devise.friendly_token.first(8)
      puts "email: #{email}, admin: #{admin}, management: #{management}, noncsit: #{noncsit}, student: #{student}, faculty: #{faculty}"
      new_user = User.create(email: email, name: name, password: password, password_confirmation: password, admin: admin, management: management, noncsit: noncsit, student: student, faculty: faculty)
      puts "Created user: #{name}"
      if new_user.save!
        new_user.send_reset_password_instructions
      else
        puts 'Could not save user.'
      end
    end

    make_user_from_file("#{Rails.root}/lib/assets/missing_mosh_users.csv")

  end
end
