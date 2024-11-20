if Rails.env.development?
  LetterOpener.configure do |config|
    # メールを保存するパスを設定
    config.location = Rails.root.join('tmp', 'letter_opener')
  end
end
