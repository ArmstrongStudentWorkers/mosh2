namespace :test_data do
  desc 'Load example poster statuses'
  task :poster_statuses => :environment do
    puts 'Deleting all PosterStatuses.'
    PosterStatus.delete_all

    names = ['Pending', 'Printing', 'Finished', 'Denied']
    names.each do |name|
      puts "Creating Poster Status: #{name}."
      PosterStatus.create!(name: name)
    end
  end
end
