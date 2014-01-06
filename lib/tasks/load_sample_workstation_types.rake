namespace :test_data do
  desc 'Load example workstation types'
  task :workstation_types => :environment do

    puts 'Deleting all WorkstationTypes.'
    WorkstationType.delete_all

    names = ['Instructor', 'Student', 'Other']
    names.each do |name|
      puts "Creating #{name}."
      WorkstationType.create!(name: name)
    end
  end
end
