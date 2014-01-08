namespace :test_data do
  desc 'Load example hours'
  task :hours => :environment do

    puts 'Deleting all Hours'
    Hour.delete_all

    monday = '8AM to 12PM, 1PM to 8PM'
    tuesday = '8AM to 8PM'
    wednesday = '8AM to 12PM, 1PM to 8PM'
    thursday = '8AM to 6PM'
    friday = '8AM to 12PM'
    saturday = '11AM to 3PM'
    location = Location.where(name: 'Science Center - 129').first

    Hour.create!(monday: monday, tuesday: tuesday, wednesday: wednesday, thursday: thursday, friday: friday, saturday: saturday, location_id: location.id)
    puts "Hours created"
  end
end
