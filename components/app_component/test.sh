#!/bin/bash

exit_code=0

echo "*** Running app component engine specs"
bundle install | grep Installing
bundle exec rake db:create db:migrate
RAILS_ENV=test bundle exec rake db:create
RALLS_ENV=test bundle exec rake db:migrate
bundle exec rspec spec
exit_code+=$?

exit $exit_code
