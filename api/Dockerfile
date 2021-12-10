# https://docs.docker.com/samples/rails/

# syntax=docker/dockerfile:1
FROM ruby:2.6.3

# yarnをインストールするためのセットアップ
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libxslt-dev libxml2-dev cmake nodejs npm mariadb-client yarn && npm install n -g && n 16.13.1

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

# コンテナが起動するたびに実行されるスクリプトの追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に実行するメインプロセスの設定
CMD ["rails", "server", "-b", "0.0.0.0"]