FROM ninja79/rails
LABEL maintainer="ninja79@github.com"
# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.

#RUN apt-get update && apt-get install -y curl

#Per YARN serve un repo apposito
#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list


#RUN apt-get update && apt-get install -y yarn

#RUN apt-get update && apt-get install -y \
#  build-essential \
#  nodejs \
#  patch ruby-dev zlib1g-dev liblzma-dev \
#  && apt-get clean
# yarn\

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app


#Install bootstrap with YARN
#RUN yarn add bootstrap@4.4.1 jquery@1.9.1 @popperjs/core
#RUN yarn add bootstrap jquery popper.js

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./

#RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./

#Upgrade db version if any upgrade occurred
#RUN bundle exec rake db:migrate RAILS_ENV=development 
RUN bundle exec rake db:migrate RAILS_ENV=development 

#Perform webpacker installation and other stuff
RUN rails webpacker:install
RUN yarn install --check-files

# Expose port 9000 to the Docker host, so we can access it
# from the outside.
EXPOSE 9000
# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "9000"]

#docker build -t airlines .
#docker run -itP -v $(pwd):/app -p 9000:9000 airlines
#docker exec -it $(docker ps -q) /bin/bash
