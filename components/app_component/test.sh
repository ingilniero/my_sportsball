#!/bin/bash

exit_code=0

echo "*** Running app component engine specs"
bundle
bundle exec rake db:create db:migrate
RAILS_ENV=test bundle exec rake db:create db:migrate
bundle exec rspec spec
exit_code+=$?

exit $exit_code