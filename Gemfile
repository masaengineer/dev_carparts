source "https://rubygems.org"

ruby "3.2.2"

# Rails本体
gem "rails", "~> 7.1.2"

# データベース
gem "pg", "~> 1.1"

# アプリケーションサーバー
gem "puma", ">= 5.0"

# アセットパイプライン
gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"

# JavaScript
gem "turbo-rails"
gem "stimulus-rails"

# JSON API
gem "jbuilder"

# キャッシュ
gem "redis", ">= 4.0.1"

# 起動時間の短縮
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
