FROM ruby:2.4.4
RUN apt-get update -qq && apt-get install -y nodejs
RUN mkdir /myapp
WORKDIR /myapp
RUN gem install bundler
COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]