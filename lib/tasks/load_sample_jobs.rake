namespace :test_data do
  desc 'Load example jobs'
  task :jobs => :environment do

    puts 'Deleting all Jobs'
    Job.delete_all
    puts 'Creating sample Jobs'

    def make_job(user)
      date = DateTime.now
      status = JobStatus.where(name: 'Pending').first
      job = Job.create!(user_id: user.id, due_date: date, job_status_id: status.id)
      puts "Created Job: #{job.id}"
    end

    users = User.all
    users.each do |user|
      make_job(user)
    end
  end
end
