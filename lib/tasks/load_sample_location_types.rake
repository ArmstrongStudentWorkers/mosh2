namespace :test_data do
  desc 'Load example location types.'
  task :location_types => :environment do

    puts 'Deleting all LocationTypes.'
    LocationType.delete_all

    names = ['Lab', 'Classroom', 'Office', 'Storage']
    names.each do |name|
      puts "Creating #{name}."
      LocationType.create!(name: name)
    end
  end
end
