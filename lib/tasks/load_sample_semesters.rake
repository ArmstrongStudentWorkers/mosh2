namespace :test_data do
  desc 'Load example semesters'
  task :semesters => :environment do

    puts 'Deleting all Semesters'
    Semester.delete_all
    puts 'Creating example Semesters'

    def make_semester(term_name, year)
      name = "#{term_name} #{year}"
      start_date = DateTime.now
      end_date = DateTime.now + 4.month
      advisement_start = DateTime.now + 2.month
      advisement_end = DateTime.now + 3.month
      term = Term.where(name: term_name).first
      Semester.create!(name: name, start_date: start_date, end_date: end_date, advisement_start: advisement_start, advisement_end: advisement_end, term_id: term.id, year: year)
      puts "Created semester: #{name}"
    end

    make_semester('Spring', 2014)
    make_semester('Summer', 2014)
    make_semester('Fall', 2014)
  end
end
