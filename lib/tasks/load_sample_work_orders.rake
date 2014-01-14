namespace :test_data do
  desc 'Load example work orders'
  task :work_orders => :environment do

    puts 'Deleting all WorkOrders'
    WorkOrder.delete_all
    puts 'Creating example WorkOrders'

    def make_workorder(status)
      3.times.with_index do |i|
        comment = "Comment#{i}"
        name = "WorkOrder#{i}"
        user = User.first
        assignee = "Assignee#{i}"
        number = "Number#{i}"
        date = DateTime.now
        WorkOrder.create!(other_number: number, assignee: assignee, comment: comment, name: name, order_status_id: status.id, user_id: user.id, closed_date: date)
       puts "Created WorkOrder: #{name} #{status.name}"
      end
    end

    OrderStatus.all.each do |status|
      make_workorder(status)
    end
  end
end
