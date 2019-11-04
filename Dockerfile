FROM ruby:2.5-slim-buster
WORKDIR /app
COPY Gemfile* ./
RUN apt-get update
RUN apt-get install -y build-essential patch ruby-dev zlib1g-dev liblzma-dev
RUN apt-get install -y libpq-dev
RUN bundle install

RUN apt-get install -y nodejs
RUN apt-get install -y npm
COPY package.json ./
RUN npm install

COPY . .
