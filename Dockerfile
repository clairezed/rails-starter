FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y apt-transport-https

# add yarn and node dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install apt based dependencies required to run Rails as 
# well as RubyGems. As the Ruby image itself is based on a 
# Debian image, we use apt-get to install those.
RUN apt-get update -qq && apt-get install -y \
  build-essential libpq-dev nodejs yarn

# Configure the main working directory. This is the base 
# directory used in any further RUN, COPY, and ENTRYPOINT 
# commands.
RUN mkdir /app
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD config/database.docker.yml /app/config/database.yml

# install node dependencies (e.g. webpack)
# next two steps will be cached unless either package.json or
# yarn.lock changes
COPY package.json yarn.lock /app/
RUN yarn install

ADD . /app