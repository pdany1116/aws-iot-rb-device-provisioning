# Fetch ruby
FROM ruby:3.1.2 AS aws_ruby_device_provisioning

# Create path where to install project
ENV INSTALL_PATH /app
RUN mkdir -p $INSTALL_PATH

# Set working directory in project path
WORKDIR $INSTALL_PATH

# Copy project files into container
COPY . .

# Install rails, bundler gems
RUN gem install bundler

# Install required gems
RUN bundle install
