#!/bin/bash
set -e

# Rails固有のpidファイルを削除
rm -f /parts-sync/tmp/pids/server.pid

# データベースが利用可能になるまで待機
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "db" -U "postgres" -c '\q'; do
  >&2 echo "Postgresqlが起動するまで待機中..."
  sleep 1
done

# データベースのセットアップとシード投入
bundle exec rails db:prepare
bundle exec rails db:seed

# サーバーの起動
exec "$@"
