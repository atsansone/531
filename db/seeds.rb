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

# Now we'll build some more intricate seed data; this sample app allows for the entry
# of quotes (actually, quotations, but whatevs) and for people to comment on the quotes.
# To show the associations at work, we'll build a few comments on each quote. Note that
# the comments are created off of the quote. instance; that is how Rails keeps track of
# the ID, even for new records, for the quote_id column on Comments.

quote = Quote.create({content: %{ To be, or not to be. }, source: %{ Shakespeare, *Hamlet* }})
comments = quote.comments.create([
  { content: %{LOL WOW awesome cool quote.}, username: 'LOLguy' },
  { content: %{I read this in high school.}, username: 'CaptainObvious' },
  { content: %{That is the question...or something.}, username: 'AttemptedSnark' }
])

quote = Quote.create({content: %{ Ask not what your country can do for you -- ask what you can do for your country. }, source: %{ President John F. Kennedy }})
comments = quote.comments.create([
  { content: %{Why don't politicians speak like this anymore?}, username: 'NostalgiaFTW' },
  { content: %{Great quote.}, username: 'CaptainObvious' }
])
