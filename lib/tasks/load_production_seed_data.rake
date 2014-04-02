namespace :db do
  desc 'Load seed data.'
  task :load_seed_data => :environment do |t, args|

    Setting.create(name: "include_mounting", set: true, description: "Enable Poster Mounting Option")

    hardware_status_names = ['Active', 'Defective', 'Overstock', 'Surplus - In Waiting', 'Surplus - Shipped']
    hardware_status_names.each do |name|
      puts "Creating hardware status: #{name}"
      HardwareStatus.create(name: name)
    end

    hardware_type_names = ['Computer', 'Monitor', 'Projector', 'Printer']
    hardware_type_names.each do |name|
      puts "Creating hardware type: #{name}"
      HardwareType.create(name: name)
    end

    job_status_names = ['Pending', 'Finished', 'Denied']
    job_status_names.each do |name|
      puts "Creating job status: #{name}"
      JobStatus.create(name: name)
    end

    location_type_names = ['Lab', 'Classroom', 'Office', 'Other']
    location_type_names.each do |name|
      puts "Creating location type: #{name}"
      LocationType.create(name: name)
    end

    order_status_names =  ['Accepted', 'Pending', 'Denied']
    order_status_names.each do |name|
      puts "Creating order status: #{name}"
      OrderStatus.create(name: name)
    end

    poster_status_names = ['Pending', 'Printing', 'Finished', 'Denied']
    poster_status_names.each do |name|
      puts "Creating poster status: #{name}"
      PosterStatus.create(name: name)
    end

    term_names = ['Spring', 'Summer', 'Fall']
    term_names.each do |name|
      puts "Creating term: #{name}"
      Term.create(name: name)
    end

    workstation_type_names = ['Instructor', 'Student', 'Other']
    workstation_type_names.each do |name|
      puts "Creating workstation type: #{name}"
      WorkstationType.create(name: name)
    end
  end
end
