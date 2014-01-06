namespace :test_data do
  desc 'Load example hardwares'
  task :hardwares => :environment do

    puts 'Deleting all Hardwares'
    Hardware.delete_all
    puts 'Creating sample Hardwares'

    def make_hardware(aasu_number, assigned_to, hardware_status_comment, hardware_status, hardware_type, manufacturer, model_number, serial_number, specs, workstation)

      name = "#{manufacturer}: #{model_number} #{hardware_type}"
      status = HardwareStatus.where(name: hardware_status).first
      type = HardwareType.where(name: hardware_type).first
      workstation.hardwares.create!(aasu_number: aasu_number, assigned_to: assigned_to, hardware_status_comment: hardware_status_comment, hardware_status_id: status.id, hardware_type_id: type.id, manufacturer: manufacturer, model_number: model_number, serial_number: serial_number, specs: specs, name: name)
      puts "Created hardware: #{name}"
    end

    instructor_workstations = WorkstationType.where(name: 'Instructor').first.workstations
    instructor_workstations.each.with_index do |workstation, i|
      aasu_number = "A#{i}"
      assigned_to = "Name#{i}"
      hardware_status_comment = "Comment#{i}"
      manufacturer = "Manufacturer#{i}"
      model_number = "Model#{i}"
      serial_number = "Serial#{i}"
      specs = "Specs#{i}"
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Active', 'Computer', manufacturer, model_number, serial_number, specs, workstation)
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Active', 'Monitor', manufacturer, model_number, serial_number, specs, workstation)
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Active', 'Projector', manufacturer, model_number, serial_number, specs, workstation)
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Active', 'Printer', manufacturer, model_number, serial_number, specs, workstation)
    end

    student_workstations = WorkstationType.where(name: 'Student').first.workstations
    student_workstations.each.with_index(1) do |workstation, i|
      aasu_number = "A#{i}"
      assigned_to = "Name#{i}"
      hardware_status_comment = "Comment#{i}"
      manufacturer = "Manufacturer#{i}"
      model_number = "Model#{i}"
      serial_number = "Serial#{i}"
      specs = "Specs#{i}"
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Active', 'Computer', manufacturer, model_number, serial_number, specs, workstation)
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Active', 'Monitor', manufacturer, model_number, serial_number, specs, workstation)
    end

    other_workstations = WorkstationType.where(name: 'Other').first.workstations
    other_workstations.each.with_index do |workstation, i|
      aasu_number = "A#{i}"
      assigned_to = "Storage"
      hardware_status_comment = "Comment#{i}"
      manufacturer = "Manufacturer#{i}"
      model_number = "Model#{i}"
      serial_number = "Serial#{i}"
      specs = "Specs#{i}"
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Defective', 'Computer', manufacturer, model_number, serial_number, specs, workstation)
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Overstock', 'Monitor', manufacturer, model_number, serial_number, specs, workstation)
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Surplus - In Waiting', 'Computer', manufacturer, model_number, serial_number, specs, workstation)
      make_hardware(aasu_number, assigned_to, hardware_status_comment, 'Surplus - Shipped', 'Monitor', manufacturer, model_number, serial_number, specs, workstation)
    end
  end
end
