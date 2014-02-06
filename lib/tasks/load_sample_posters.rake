namespace :test_data do
  desc 'Load example posters'
  task :posters => :environment do

    puts 'Deleting all Posters'
    Poster.delete_all
    puts 'Creating sample Posters.'

    def make_poster(name, job, request)
      status = PosterStatus.where(name: 'Pending').first
      attachment = File.open("#{Rails.root}/app/assets/images/mosh-cropped.png")
      Poster.create!(name: name, length: 30, width: 30, special_request: request, job_id: job.id, poster_status_id: status.id, attachment: attachment) 
      puts "Created poster: #{job.name} #{name}"
    end

    jobs = Job.all
    jobs.each do |job|
      1.upto(3).with_index do |i|
        name = "Poster#{i}"
        request = "Request#{i}"
        make_poster(name, job, request)
      end
    end

  end
end
