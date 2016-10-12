FROM ruby:2.3.1

RUN mkdir -p /opt/
WORKDIR /opt

RUN apt-get update
RUN apt-get -y install git nodejs

RUN git clone https://github.com/Thibaut/devdocs.git
WORKDIR /opt/devdocs

RUN bundle install --system
ARG docs
RUN thor docs:download $docs

EXPOSE 9292
CMD rackup -o 0.0.0.0
