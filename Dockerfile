FROM ruby:2.7.3

WORKDIR /app

RUN apt-get update && apt-get install -y \
  curl \
  cron \
  build-essential \
  libpq-dev
COPY PokemonApi/Gemfile /app/Gemfile
COPY PokemonApi/Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 0755 /docker-entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["/bin/bash","-c", "/docker-entrypoint.sh"]
