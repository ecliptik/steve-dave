FROM ruby:2.5
LABEL maintainer="Micheal Waltz <ecliptik@gmail.com>"

#Setup environment and copy contents
WORKDIR /app
COPY . .

#Run ruby script
ENTRYPOINT [ "ruby", "/app/steve-dave.rb" ]
