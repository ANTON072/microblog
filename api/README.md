# README

dockerは以下のドキュメントを参考に作成している。  
https://docs.docker.com/samples/rails/

## 最初にやること

```sh
# GemfileやDockerfileに変更があった場合はビルドを実行する
docker-compose build
# webpackのインストール
docker-compose run web rails webpacker:install
# DBの作成
docker-compose run web rake db:create
# railsの起動
docker-compose up
```

`http://localhost:9999/` でローカルサーバーが起動する。