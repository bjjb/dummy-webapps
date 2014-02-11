Dummy Web Application
=====================

Rails 2
-------

A dummy web application, which I find useful for playing around with, or
testing. This is the Rails 2 version, which can run on Ruby 1.8.7. It's data
structure consists of:

Tables:
- `products`
- `users`
- `taggings`
- `tags`
- `categories`
- `categories_products`

Models:
- `Product`
- `User`
- `Tag`
- `Tagging`
- `Category`

and it's seeded (or can be quickly seeded) with 3 users (Alice, Bob
and Cecil), who have 2 products each, some of which are tagged and
categorized. 

To get set up:

* `git clone -b rails2 https://github.com/bjjb/dummy-webapp`
* `cd rails2`
* Check that you're using your preferred version of Ruby; if you have a
  properly configured Ruby Version Manager, then it should autodetect the
  '.ruby-version' in the root of the app.
* `bundle install`
* `rake db:setup`
* `rake test`

If all goes well, you have a perfectly functioning Rails 2 application to
tinker with. Start it with `./script/server`, or whatever.

Other versions are in different branches in this repository.
