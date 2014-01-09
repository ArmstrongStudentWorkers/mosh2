namespace :test_data do
  desc 'Load example order statuses'
  task :order_statuses => :environment do

    puts 'Deleting all OrderStatuses.'
    OrderStatus.delete_all

    names = ['Accepted', 'Pending', 'Denied']
    names.each do |name|
      puts "Creating Order Status: #{name}."
      OrderStatus.create!(name: name)
    end
  end
end
