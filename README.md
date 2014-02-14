# MOSH

The McCarthy Online Support Hub

MOSH is a Ruby on Rails application offering the following services for the [Armstrong Atlantic State University] (http://www.armstrong.edu/) Department of [Computer Science and Information Technology] (http://www.armstrong.edu/Science_and_Technology/ice/ice_welcome):

  + Lab Module
    - Lab Overview
    : An overview of CS/IT department computer labs, including lab hours, typical hardware setups, and installed software.
    - Inventory
    : A list of CS/IT department hardware, organized by location, status, and hardware type.
    - Imaging
    : An overview of software installed on CS/IT department computers, organized by lab.
    - After Hours Access
    : A list of students granted access to CS/IT computer labs after hours.
  + Poster Module
  : A module designed to allow faculty and staff of the College of Science and Technology to order posters.
  + Work Order Module
  : A module designed to track interdepartmental work orders.
  + Supply Module
  : A module designed to track printer ink and toner supplies.
  + Advisement Module
  : A module designed to facilitate advisement for IT majors.

## Installation Instructions

Go into your projects directory

    cd projects

Clone the repo

    git clone https://github.com/ArmstrongStudentWorkers/mosh2.git

Go into the project

    cd mosh2

Install the project's dependencies

    bundle install

Create the database

    rake db:migrate

Add test data to the development database

    rake test_data:all

Copy the config/database.yml.example file to config/database.yml

    cp config/database.yml.example config/database.yml

Use your text editor to change the development, test, and/or production database configurations. Ask [faith.anne@gmail.com](http://github.com/faithanne) if you have any questions, or if you need access to the MOSH mysql server.

Now get developing!
