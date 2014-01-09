namespace :test_data do
  desc 'Load example work orders'
  task :work_orders => :environment do

    puts 'Deleting all WorkOrders'
    WorkOrder.delete_all
    puts 'Creating example WorkOrders'

    def make_workorder(status)
      3.times.with_index do |i|
        comment = "Comment#{i}"
        hardware = Hardware.first
        name = "WorkOrder#{i}"
        user = User.first
        date = DateTime.now
        WorkOrder.create!(comment: comment, hardware_id: hardware.id, name: name, order_status_id: status.id, user_id: user.id, closed_date: date)
       puts "Created WorkOrder: #{name} #{status.name}"
      end
    end

    OrderStatus.all.each do |status|
      make_workorder(status)
    end
  end
end
