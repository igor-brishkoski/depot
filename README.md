== README

CURRENT CHAPTER === Chapter 12.2 Iteration G2: Atom Feeds


* ...
```bash
heroku pg:backups capture --app depot-bri6ko-staging && curl -o latest.dump `heroku pg:backups public-url -a depot-bri6ko-staging` && pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d depot_development latest.dump
```

Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
