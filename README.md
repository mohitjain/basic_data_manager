# Welcome to the setup guide

## Requirements

* Ubuntu
* Ruby
* Rails
* Mysql
* RVM


### Installation guide

1. Install RVM

    \curl -sSL https://get.rvm.io | bash -s stable --ruby

2. Download the code and go to the directory. Go in and then out of the directory and then go back in the directory. If it asks for some permission for execution give it that permission. It will be simple yes or no option. Run the following command going in the project directory

    bundle install

3. Setup the database. Open config/database.yml file and setup the configuration for the database like username and password. and then run the following commands

    rake db:create && rake db:migrate

4. Run the server and background process in two different terminal tabs

    rails s
    rake jobs:work

5. Now open your browser and point your browser to

    http://localhost:3000

    default username and password is: admin@example.com / password


6. Under uploads section you can upload the file with name and notes and xlxs file. System assume the exactly same of the headers. In the same file provided partner was having #. I am assuming that is a typo. Order is not important but exact spell and case for the header is important. In case you want to change the header name to give it a proper format. You can just change that in app/models/upload.rb line no. 20-52.


Good luck. In case you need some help feel free to contact me
