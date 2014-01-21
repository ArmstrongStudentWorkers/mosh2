namespace :test_data do
  desc 'Load example job statuses'
  task :job_statuses => :environment do

    puts 'Deleting all JobStatuses.'
    JobStatus.delete_all

    names = ['Pending', 'Finished', 'Denied']
    names.each do |name|
      puts "Creating Job Status: #{name}."
      JobStatus.create!(name: name)
    end
  end
end
