#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Go back to hub_worker
cd /app

echo 'updating gem.....'
if [ -e Gemfile ]; then
  bundle check || bundle install
fi

# update rake task
bin/rake -T

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"