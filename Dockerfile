ARG DB_URL
ARG DB_HOST
ARG RAILS_MASTER_KEY
ARG RAILS_ENV
FROM ruby:3.2.2
# The qq is for silent output in the console
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim postgresql-client nano

# Sets the path where the app is going to be installed
ENV RAILS_ROOT /var/www/

# Creates the directory and all the parents (if they don't exist)
RUN mkdir -p $RAILS_ROOT

# This is given by the Ruby Image.
# This will be the de-facto directory that 
# all the contents are going to be stored. 
WORKDIR $RAILS_ROOT

# We are copying the Gemfile first, so we can install 
# all the dependencies without any issues
# Rails will be installed once you load it from the Gemfile
# This will also ensure that gems are cached and onlu updated when 
# they change.
COPY Gemfile ./
COPY Gemfile.lock ./
# Installs the Gem File.
RUN bundle install

# We copy all the files from the current directory to our
# /app directory
# Pay close attention to the dot (.)
# The first one will select ALL The files of the current directory, 
# The second dot will copy it to the WORKDIR!
COPY . .
RUN echo DB_URL=$DB_URL >> .env
RUN echo RAILS_ENV=$RAILS_ENV >> .env
RUN echo RAILS_MASTER_KEY=$RAILS_MASTER_KEY >> .env
RUN echo DB_HOST=$DB_HOST >> .env

RUN bin/rails assets:precompile
RUN bin/rails db:setup
EXPOSE 3000
CMD ["./bin/rails", "server", "--binding=0.0.0.0"]
