FROM ruby:3.0.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN bundle exec rake assets:precompile || echo "Skipping precompile"

ENV RAILS_ENV=development

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
