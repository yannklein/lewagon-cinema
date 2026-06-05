FROM ruby:3.2.2

RUN apt-get update && apt-get install -y \
  build-essential libpq-dev libssl-dev \
  libyaml-dev zlib1g-dev libffi-dev \
  nodejs yarn

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .
RUN bundle exec rake assets:precompile

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]