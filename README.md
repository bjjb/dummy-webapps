Dummy Web Application
=====================

ActiveRecord
------------

A dummy ActiveRecord application, useful for playing around with ActiveRecord,
or for writing tests. Makes a Sqlite3 database in memory.

Creates the following tables:

- `products`
- `users`
- `taggings`
- `tags`
- `categories`
- `categories_products`

and models:

- `Product`
- `User`
- `Tag`
- `Tagging`
- `Category`

and 3 users (Alice, Bob and Cecil), who have 2 products each, some of which
are tagged and categorized.

To poke around, try

    bundle
    ruby app.rb

This will load the app and start up a pry session.
