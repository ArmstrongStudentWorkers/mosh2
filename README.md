# MOSH
=====
The McCarthy Online Support Hub

MOSH is a Ruby on Rails application offering the following services for the [Armstrong Atlantic State University] (http://www.armstrong.edu/) [Department of Computer Science and Information Technology] (http://www.armstrong.edu/Science_and_Technology/ice/ice_welcome).

  + Lab Module
    - Lab Overview
    - Inventory
    - Imaging
    - After Hours Access
  + Poster Module
  + Work Order Module
  + Supply Module
  + Advisement Module

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

And you're done!
