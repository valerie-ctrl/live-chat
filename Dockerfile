# Use an official Ruby runtime as a parent image
FROM ruby:3.1.2

# Set the working directory in the container to /app
WORKDIR /app

# Install Node.js
RUN apt-get update && apt-get install -y nodejs

# Copy Gemfile and Gemfile.lock into the container at /app
COPY Gemfile Gemfile.lock /app/

# Install any needed gems
RUN bundle install

# Copy the current directory contents into the container at /app
COPY . /

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
