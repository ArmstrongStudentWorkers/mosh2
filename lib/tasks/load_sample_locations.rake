namespace :test_data do
  desc 'Load example locations.'
  task :locations => :environment do

    puts 'Deleting all Locations.'
    Location.delete_all
    puts 'Creating sample Locations.'

    name = 'Science Center - 129'
    room = 'SC129'
    comment = ''
    type = LocationType.where(name: 'Lab').first
    location = Location.create!(name: name, room: room, comment: comment)
    location.location_type = type
    location.save!

    name = 'Science Center - 2506'
    room = 'SC2506'
    comment = ''
    type = LocationType.where(name: 'Classroom').first
    location = Location.create!(name: name, room: room, comment: comment)
    location.location_type = type
    location.save!

    name = 'Science Center - 125'
    room = 'SC125'
    comment = 'Server Room'
    type = LocationType.where(name: 'Storage').first
    location = Location.create!(name: name, room: room, comment: comment)
    location.location_type = type
    location.save!

    name = "Dr. Hamza-Lup's Office"
    room = 'SC128'
    comment = ''
    type = LocationType.where(name: 'Office').first
    location = Location.create!(name: name, room: room, comment: comment)
    location.location_type = type
    location.save!
  end
end
