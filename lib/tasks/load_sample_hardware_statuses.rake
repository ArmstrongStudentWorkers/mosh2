namespace :test_data do
  desc 'Load example hardware statuses'
  task :hardware_statuses => :environment do

    puts 'Deleting all HardwareStatuses.'
    HardwareStatus.delete_all

    names = ['Active', 'Defective', 'Overstock', 'Surplus - In Waiting', 'Surplus - Shipped']
    names.each do |name|
      puts "Creating #{name}."
      HardwareStatus.create!(name: name)
    end
  end
end
