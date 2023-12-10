FROM ruby:3.2.2
# The qq is for silent output in the console
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim postgresql-client

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
RUN --mount=type=secret,id=DB_URL \
    DB_URL="$(cat /run/secrets/DB_URL)" \
    bin/rails assets:precompile
EXPOSE 3000
CMD ["./bin/rails", "server", "--binding=0.0.0.0"]
