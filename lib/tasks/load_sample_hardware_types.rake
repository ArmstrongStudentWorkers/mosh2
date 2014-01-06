namespace :test_data do
  desc 'Load example hardware types'
  task :hardware_types => :environment do

    puts 'Deleting all HardwareTypes.'
    HardwareType.delete_all

    names = ['Computer', 'Monitor', 'Projector', 'Printer']
    names.each do |name|
      puts "Creating #{name}"
      HardwareType.create!(name: name)
    end
  end
end
