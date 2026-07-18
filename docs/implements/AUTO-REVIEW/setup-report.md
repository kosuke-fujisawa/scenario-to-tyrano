# AUTO-REVIEW 設定作業実行

## 作業概要

- **タスクID**: AUTO-REVIEW
- **作業内容**: arikoiと同じAIレビューActionの導入
- **実行日**: 2026-07-18

## 参照した設定

- `arikoi/.github/workflows/ai-review.yml`
- `arikoi/.github/ai-review-instructions.md`
- `kosuke-fujisawa/ai-review-action@v1` の `action.yml` と `README.md`
- 本リポジトリの `AGENTS.md`

## 実行した作業

- `.github/workflows/ai-review.yml` をarikoiと同じ起動条件・権限・Action入力で追加した
- `.github/ai-review-instructions.md` に共通の根拠重視方針と、自然言語からティラノスクリプトへの変換に限定したプロジェクト固有方針を追加した
- READMEに起動条件、必須Secret、任意Variableを追記した

## 外部設定の前提

- 必須: リポジトリSecret `OPENAI_API_KEY`
- 任意: リポジトリVariable `AI_REVIEW_MODEL`（未設定時は `gpt-5-mini`）

GitHubは既存Secretの値を再取得できないため、arikoiの`OPENAI_API_KEY`は自動転送しない。対象リポジトリに別途設定する。
