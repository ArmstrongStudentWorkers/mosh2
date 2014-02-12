namespace :test_data do
  desc 'Load example after hours accesses'
  task :after_hours_accesses => :environment do

    puts 'Deleting all AfterHoursAccesses'
    AfterHoursAccess.delete_all
    puts 'Creating example After Hours Accesses'

    def make_access(location, user, semester)
      10.times.with_index do |i|
        first = "First#{i}"
        last = "Last#{i}"
        sid = "SID#{i}#{i}#{i}"
        AfterHoursAccess.create!(first_name: first, last_name: last, sid: sid, user_id: user.id, location_id: location.id, semester_id: semester.id)
       puts "Created After Hours Access: #{first} #{last}"
      end
    end

    labs = LocationType.where(name: 'Lab').first.locations
    users = User.where(noncsit: false)
    labs.each do |location|
      users.each do |user|
        Semester.all.each do |semester|
          make_access(user, location, semester)
        end
      end
    end
  end
end
