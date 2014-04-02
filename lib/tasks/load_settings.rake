namespace :test_data do
  desc 'Load example settings'
  task :settings => :environment do

    puts "Deleting all Settings"
    Setting.delete_all
    puts 'Creating sample Settings'

    def make_setting(name, set, description)
      setting = Setting.create!(name: name, set: set, description: description)
      puts "Created Setting: #{name}"
    end

    make_setting("include_mounting", true, "Enable Poster Mounting Option")
  end
end
