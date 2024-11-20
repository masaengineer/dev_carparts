- [ ] **デフォルトの機能を使用する**
  - [ ] `/users/edit`にアクセスしてパスワード変更フォームを表示

- [ ] **カスタマイズした機能を実装する**
  - [ ] コントローラーを作成
    - [ ] `app/controllers/users/passwords_controller.rb`を作成
      - [ ] `edit`アクションを定義
      - [ ] `update`アクションを定義
      - [ ] `password_params`メソッドを定義
  - [ ] ビューファイルを作成
    - [ ] `app/views/users/passwords/edit.html.erb`を作成
      - [ ] フォームを作成し、エラーメッセージを表示
  - [ ] ルーティングを追加
    - [ ] `config/routes.rb`にルートを追加
      - [ ] `get 'users/edit_password'`を追加
      - [ ] `patch 'users/update_password'`を追加

- [ ] **注意点**
  - [ ] `update_with_password`メソッドを使用
  - [ ] `bypass_sign_in`を使用して再ログインを回避
  - [ ] バリデーションエラー時にフォームに戻る

- [ ] **セキュリティ対策**
  - [ ] `before_action :authenticate_user!`で認証を行う
  - [ ] Strong Parametersを使用
  - [ ] 現在のパスワードの確認を必須にする
