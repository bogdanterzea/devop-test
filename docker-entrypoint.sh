#!/bin/sh
set -e

# Check if we're running inside Docker and set necessary options
if [ "$RAILS_ENV" = "development" ] || [ "$RAILS_ENV" = "test" ]; then
  # Use polling instead of inotify for the development environment
  export DISABLE_SPRING=true
  export LISTEN_USE_POLLING=true
fi

exec "$@"
