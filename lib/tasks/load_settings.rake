namespace :test_data do
  desc 'Load example settings'
  task :settings => :environment do

    puts "Deleting all Settings"
    Setting.delete_all
    puts 'Creating sample Settings'

    def make_setting(name, set)
      setting = Setting.create!(name: name, set: set)
      puts "Created Setting: #{name}"
    end

    make_setting("include_mounting", true)
  end
end
