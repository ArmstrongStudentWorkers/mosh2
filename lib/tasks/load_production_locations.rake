namespace :db do
  desc 'Load locations to production db'
  task :locations => :environment do

    def make_location(name, room, comment, type)
      puts "Creating location: #{name}"
      Location.create!(name: name, room: room, comment: comment, location_type_id: type.id)
    end

    lab_type = LocationType.where(name: 'Lab').first
    make_location('Science Center - 129', 'SC129', '', lab_type)
    make_location('Science Center - 1503A', 'SC1503A', '', lab_type)
    make_location('Science Center - 1503B', 'SC1503B', '', lab_type)
    make_location('NEWS Lab / other', 'SC121', '', lab_type)
    make_location('Unix Lab / ACM', 'SC122', '', lab_type)

    classroom_type = LocationType.where(name: 'Classroom').first
    make_location('Science Center - 2506', 'SC2506', '', classroom_type)

    other_type = LocationType.where(name: 'Other').first
    make_location('Science Center - 125', 'SC125', 'Server room', other_type)
    make_location('Science Center - 143', 'SC143', 'Student Worker room, behind SC129', other_type)
    make_location('Tutor Center', 'SC132/134', '', other_type)

    office_type = LocationType.where(name: 'Office').first
    make_location('CS/IT Department Office', 'SC202', '', office_type)
    make_location("Mr. McCarthy's Office", 'SC102', '', office_type)
    make_location("Dr. Reed's Office", 'SC111', '', office_type)
    make_location("Dr. Liang's Office", 'SC112', '', office_type)
    make_location('Temp Office', 'SC123', '', office_type)
    make_location("Dr. Zhang's Office", 'SC124', '', office_type)
    make_location("Dr. Su's Office", 'SC126', '', office_type)
    make_location("Dr. Hamza-Lup's Office", 'SC128', '', office_type)
    make_location('Temp Office', 'SC135', '', office_type)
    make_location("Dr. Saad's Office", 'SC206', '', office_type)
    make_location("Dr. Lau's Office", 'SC208', '', office_type)
    make_location("Mr. Katz' Offce", 'SC210', '', office_type)
    make_location("Dr. Hashemi's Office", 'SC276', '', office_type)
  end
end
