FROM public.ecr.aws/docker/library/ruby:2.7-slim
LABEL maintainer="Micheal Waltz <dockerfiles@ecliptik.com>"

#Set timezone to US/Pacific
RUN cp /usr/share/zoneinfo/US/Pacific /etc/localtime

#Setup environment and copy contents
WORKDIR /app
COPY . .

#Run ruby script
ENTRYPOINT [ "ruby", "/app/steve-dave.rb" ]
