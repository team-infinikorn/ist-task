wh: rails runner tcp_server.rb -p 6005
web: bundle exec puma -t 5:5 -p 3000 -e ${RACK_ENV}
worker: bundle exec rake jobs:work