- [x] **プロジェクトにアイテムを作成**
  - コマンド:
    ```bash:/parts-sync/create_item.sh
    gh project item-create 2 --title "テスト投稿" --body "これはテスト投稿です。" --status "ToDo" --assignee masaengineer
    ```
  - **課題**: `--status` オプションが不明なフラグとして認識されるエラー発生

- [x] **パーソナルアクセストークンの権限確認と更新**
  - **手順**:
    1. GitHubにログイン
    2. **Settings > Developer settings > Personal access tokens** に移動
    3. 新しいトークンを生成し、`repo` と `project` スコープを付与
    4. `.env` ファイルを更新:
       ```env:/parts-sync/.env
       GITHUB_TOKEN=your_new_github_token_with_project_access
       ```
    5. Dockerイメージの再ビルドとコンテナの再起動:
       ```bash:/parts-sync/rebuild_docker.sh
       docker-compose build
       docker-compose up -d
       ```
    6. コンテナ内での認証:
       ```bash:/parts-sync/auth_container.sh
       docker exec -it parts-sync_web_1 /bin/bash
       echo "your_new_github_token_with_project_access" | gh auth login --with-token
       ```
  - **課題**: `HTTP 401: Bad credentials` エラー発生

- [x] **`gh project item-list` コマンドでアイテムを取得**
  - コマンド:
    ```bash:/parts-sync/list_items.sh
    gh project item-list 2 --format json --limit 5
    ```
  - **課題**: `--limit` オプションが不明なフラグとして認識されるエラー発生

- [x] **ヘルプコマンドで利用可能なオプション確認**
  - コマンド:
    ```bash:/parts-sync/help_item_list.sh
    gh project item-list --help
    ```

- [x] **JSON出力の構造確認と`jq`フィルターの修正**
  - **初回コマンド**:
    ```bash:/parts-sync/initial_jq.sh
    gh project item-list 2 --format json --limit 5 --jq '.[] | {タイトル: .content.title, 番号: .content.number, URL: .content.url}'
    ```
  - **課題**: `expected an object but got: array` エラー発生
  - **修正後コマンド**:
    ```bash:/parts-sync/corrected_jq.sh
    gh project item-list 2 --format json --limit 5 --jq '.items | sort_by(.content.number) | reverse | .[] | {"タイトル": .content.title, "番号": .content.number, "URL": .content.url}'
    ```

- [ ] **追加の調査と確認**
  - JSON構造の詳細確認:
    ```bash:/parts-sync/inspect_json.sh
    gh project item-list 2 --format json --limit 5
    ```
  - パーソナルアクセストークンのスコープ確認:
    ```bash:/parts-sync/check_auth.sh
    gh auth status
    ```
  - Dockerコンテナ内に`jq`がインストールされているか確認・インストール:
    ```bash:/parts-sync/install_jq.sh
    apt-get update
    apt-get install -y jq
    ```

- [ ] **ドキュメントの参照**
  - [GitHub CLI マニュアル](https://cli.github.com/manual/)
  - 特に以下のコマンドのドキュメント確認:
    - `gh project item-add`
    - `gh project item-list`
    - `gh project edit`
    - `gh issue list`
    - `gh issue edit`
    - その他関連コマンド

- [ ] **認証トークンの再生成と設定**
  - 必要に応じて新しいトークンを生成し、再設定
