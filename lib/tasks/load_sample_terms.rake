namespace :test_data do
  desc 'Load example terms'
  task :terms => :environment do

    puts 'Deleting all Terms'
    Term.delete_all

    names = ['Spring', 'Summer', 'Fall']
    names.each do |name|
      puts "Creating term: #{name}"
      Term.create!(name: name)
    end
  end
end
