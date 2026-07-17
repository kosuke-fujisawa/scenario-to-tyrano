# AUTO-REVIEW 設定確認

## 確認概要

- **タスクID**: AUTO-REVIEW
- **確認内容**: AIレビューワークフローの静的検証とGitHub前提条件の確認
- **実行日**: 2026-07-18

## 確認結果

- [x] arikoiの`.github/workflows/ai-review.yml`と内容が一致する
- [x] `actionlint .github/workflows/ai-review.yml` が成功する
- [x] `kosuke-fujisawa/ai-review-action@v1`の必須入力 `github-token` と `openai-api-key` を指定している
- [x] ワークフローの権限が `checks: read` / `contents: read` / `pull-requests: write` に限定されている
- [x] Fork PRとDraft PRでSecretを使うjobが起動しない
- [x] 対象リポジトリでGitHub Actionsが有効で、外部Actionの実行が許可されている
- [x] GITHUB_TOKENの既定権限はarikoiと同じ`read`で、本ワークフローが必要な`pull-requests: write`を明示している
- [x] arikoiの同一ワークフローが直近のPull Requestで成功している
- [x] 対象リポジトリのSecret `OPENAI_API_KEY` が設定されている
- [ ] ワークフローをdefault branchに反映後、Draftでない同一リポジトリ内PRで実行成功とレビューコメント投稿を確認する

## 現在の判定

ローカルの設定、静的検証、Secretの前提確認は完了。実動確認はdefault branchへのワークフロー反映後に行う。
