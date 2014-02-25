namespace :db do
  desc 'Load semesters to production db'
  task :semesters => :environment do

    def make_semester(term_name, year, start_date, end_date, advisement_start, advisement_end)
      name = "#{term_name} #{year}"
      s_start = start_date.to_datetime
      s_end = end_date.to_datetime
      a_start = advisement_start.to_datetime
      a_end = advisement_end.to_datetime
      term = Term.where(name: term_name).first

      Semester.create!(name: name, start_date: s_start, end_date: s_end, term_id: term.id, year: year, advisement_start: a_start, advisement_end: a_end)
      puts "Semester created: #{name}"
    end

    make_semester('Spring', '2014', 'Jan 13, 2014', 'May 5, 2014', 'Oct 21, 2013', 'Nov 8, 2013')
    make_semester('Summer', '2014', 'May 19, 2014', 'July 24, 2014', 'Oct 21, 2013', 'Nov 8, 2013')
    make_semester('Fall', '2014', 'Aug 18, 2014', 'Dec 5, 2014', 'Mar 24, 2014', 'Apr 18, 2014')
    make_semester('Spring', '2015', 'Jan 12, 2015', 'May 1, 2015', 'Oct 20, 2014', 'Nov 7, 2014')
  end
end
