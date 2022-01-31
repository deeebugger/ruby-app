FROM ruby:3.0
RUN adduser -D ruby-user
USER ruby-user
WORKDIR /home/ruby-user
COPY --chown=ruby-user Gemfile Gemfile.lock ./
RUN bundle install
COPY --chown=ruby-user configs/httpserver.rb .
EXPOSE 8080
CMD ruby http_server.rb