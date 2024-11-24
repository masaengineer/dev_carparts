# ベースイメージとしてRuby 3.1.4を使用
FROM ruby:3.1.4

# 必要なパッケージをインストール
# build-essential: コンパイルツール
# libpq-dev: PostgreSQLクライアント開発用ライブラリ
# nodejs: JavaScriptランタイム
# vim, curl, gnupg: 開発用ユーティリティ
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim curl gnupg

# GitHub CLIをインストールするための準備
# GPGキーの取得と設定、リポジトリの追加
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
    chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# GitHub CLIのインストールとキャッシュクリーンアップ
RUN apt-get update && \
    apt-get install -y gh && \
    rm -rf /var/lib/apt/lists/*

# アプリケーションのワクディレクトリを設定
WORKDIR /parts-sync

# Gemfileのコピー
COPY Gemfile /parts-sync/

# Bundlerのインストールとセットアップ
RUN gem install bundler:2.3.26

# 初期のbundle installを実行
COPY Gemfile /parts-sync/
RUN bundle install --jobs 4 --retry 3

# アプリケーションのソースコードをコピー
COPY . /parts-sync

# entrypoint.shをコピーして実行権限を付与
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# エントリーポイントを設定
ENTRYPOINT ["entrypoint.sh"]

# 最終的なbundle install
RUN bundle install --jobs 4 --retry 3

# PostgreSQLクライアントをインストール
RUN apt-get update && apt-get install -y postgresql-client
