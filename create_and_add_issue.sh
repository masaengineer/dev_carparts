#!/bin/bash

# スクリプトが失敗した場合に即座に終了
set -e

# 変数の設定
TITLE="新しいIssueのタイトル"  # 適切なタイトルを設定してください
BODY_FILE="gh-issue.md"  # チェックリストの内容を記載したファイル
ASSIGNEE="masaengineer"
PROJECT_NUMBER=2
OWNER="masaengineer"  # オーナー名を明示的に設定

# Issueを作成し、番号を取得
ISSUE_NUMBER=$(gh issue create \
  --title "$TITLE" \
  --body-file "$BODY_FILE" \
  --assignee "$ASSIGNEE")

# デバッグ用にIssue番号を表示
echo "取得したIssue番号: $ISSUE_NUMBER"

# 作成されたIssueのURLを構築
ISSUE_URL="https://github.com/$OWNER/parts-sync/issues/${ISSUE_NUMBER##*/}"

# 取得したIssueのURLを表示
echo "作成されたIssueのURL: $ISSUE_URL"

# プロジェクトにIssueを追加（オーナーを明示的に指定）
gh project item-add "$PROJECT_NUMBER" --owner "$OWNER" --url "$ISSUE_URL"

# 成功メッセージ
echo "Issueをプロジェクト番号 $PROJECT_NUMBER に追加しました。"
