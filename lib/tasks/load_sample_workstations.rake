namespace :test_data do
  desc 'Load example workstations'
  task :workstations => :environment do

    puts 'Deleting all Workstations'
    Workstation.delete_all
    puts 'Creating sample Workstations'

    def make_workstation(location, number, workstation_type)
      name = "#{location.name} - #{number}"
      type = WorkstationType.where(name: workstation_type).first
      location.workstations.create!(name: name, number: number, workstation_type_id: type.id)
      puts "Created workstation: #{name}"
    end

    lab_locations = LocationType.where(name: 'Lab').first.locations
    lab_locations.each do |location|

      make_workstation(location, '0', 'Instructor')

      1.upto(9).with_index do |i|
        make_workstation(location, i, 'Student')
      end
    end

    locations = LocationType.where(name: 'Classroom').first.locations
    locations += LocationType.where(name: 'Office').first.locations
    locations.each do |location|
      make_workstation(location, '0', 'Instructor')
    end

    storage = LocationType.where(name: 'Storage').first.locations
    storage.each do |location|
      5.times.with_index do |i|
        make_workstation(location, i, 'Other')
      end
    end
  end
end
