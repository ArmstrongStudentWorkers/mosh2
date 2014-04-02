namespace :test_data do
  desc 'Load all sample data'
  task :all => :environment do

    Rake::Task["test_data:settings"].execute  # Load sample settings
    Rake::Task["test_data:users"].execute    # Load sample users
    Rake::Task["test_data:terms"].execute    # Load sample terms
    Rake::Task["test_data:semesters"].execute    # Load sample semesters
    Rake::Task["test_data:location_types"].execute    # Load sample location types
    Rake::Task["test_data:locations"].execute    # Load sample locations
    Rake::Task["test_data:after_hours_accesses"].execute    # Load sample after hours accesses
    Rake::Task["test_data:hardware_statuses"].execute    # Load sample hardware statuses
    Rake::Task["test_data:hardware_types"].execute    # Load sample hardware types
    Rake::Task["test_data:workstation_types"].execute    # Load sample workstation types
    Rake::Task["test_data:workstations"].execute    # Load sample workstations
    Rake::Task["test_data:hardwares"].execute    # Load sample hardwares
    Rake::Task["test_data:hours"].execute    # Load sample hours
    Rake::Task["test_data:job_statuses"].execute    # Load sample job statuses
    Rake::Task["test_data:jobs"].execute    # Load sample jobs
    Rake::Task["test_data:order_statuses"].execute    # Load sample order statuses
    Rake::Task["test_data:poster_statuses"].execute    # Load sample poster statuses
    Rake::Task["test_data:posters"].execute    # Load sample posters
    Rake::Task["test_data:work_orders"].execute    # Load sample work orders
  end
end
