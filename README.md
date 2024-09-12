# Conveyance

This is a Ruby on Rails application that allows you to create projects and discuss them. Users can:

* view a project's conversation history, including status updates.

* leave a comment

* change the status of the project

To run this app on your machine, clone the repository and run the following commands on the command line:

Install the gems in the Gemfile:
```bash
bundle install
```

Create and migrate the database. This app uses PostgreSQL:
```bash
rails db:create
rails db:migrate
```

Seed the database with some example data. See [db/seeds.rb](db/seeds.rb) to see a project with conversation history about this project.

```bash
rails db:seed:replant
```

Start the Rails server:
```bash
./bin/dev
```

You can see the app at http://localhost:3000.

Run the test suite:
```bash
rspec
```


Refactoring
======

One part of this app that could be improved is to create a method or model for Project history. 

At the moment, a project's history is created in the controller. 

It would be better to move it to the Project model as a method or create a separate model (or PORO) called ProjectHistory which contains that logic. 

That would make it easier to test and update in the future.
