# https://docs.docker.com/samples/rails/

# syntax=docker/dockerfile:1
FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs mariadb-client
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