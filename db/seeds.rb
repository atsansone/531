# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Using the .delete_all method on a given model deletes any existing records;
# note that it may be better to run
    # $ rake db:drop
# followed by
    # $ rake db:migrate
# before running
    # $ rake db:seed
# to seed your data.

Page.delete_all

# Rails is smart enough to create individual records from an array of hashes.
# This seed data will create a Welcome and About page. Note the %{ } shorthand
# syntax for longer strings.

pages = Page.create([
  { title: 'Welcome', content: %{ This is the home page. } },
  { title: 'About', content: %{ This is the about page. } }
  ])
