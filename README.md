== README

CURRENT CHAPTER === Task E: A Smarter Cart

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
```bash
heroku pg:backups capture --app depot-bri6ko-staging && curl -o latest.dump `heroku pg:backups public-url -a depot-bri6ko-staging` && pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d depot_development latest.dump
```

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.