# scenario-to-tyrano

自然言語で記述されたノベルゲームシナリオを、ティラノスクリプト（.ks）へ変換するClaude Code Skill。

作者がシナリオ、台詞、地の文、演出、分岐などを自然な形式で記述し、ティラノスクリプトのタグや構文を直接意識せずに、編集可能な`.ks`の初稿を生成できるようにします。完成品を自動生成するツールではなく、ティラノスクリプトで編集可能な初稿を生成する制作支援ツールです。

## ステータス

**初期段階の実験的Skill（v0.1）です。** 変換結果は必ず作者自身が確認・編集してください。

## 処理の流れ

```text
自然言語のシナリオ
↓
scenario-to-tyrano
↓
ティラノスクリプト（.ks）
↓
ティラノスクリプトで編集・実行
```

入力は、シナリオの意図が自然言語で書かれたテキストファイルであれば、形式を問いません。たとえば次のいずれでも構いません。

- 音声文字起こし
- 通常の文章
- 脚本形式
- 箇条書き
- シーンメモ

特定の入力形式や固定書式を覚える必要はありません。

## 本リポジトリが行うこと

- 自然言語で記述されたシナリオの解釈
- セリフ、地の文、場面、演出、分岐、状態変化、遷移の抽出
- `.ks`ファイルの生成
- 最低限の構造確認（ラベル重複、未定義ジャンプ先など）

## 行わないこと

- 音声録音、音声認識、音声ファイルの直接処理、特定の音声認識サービスとの連携
- 独自シナリオDSL・独自ノベルゲームエンジン・独自ランタイムの実装
- GUI、ティラノのランタイムプラグイン
- シナリオ本文の自動創作、原稿の無断推敲
- 作者の意図の無断補完（判断できない箇所はTODOとして残します）

## 使用方法

Claude Code でこのリポジトリ（またはSkillを配置したプロジェクト）を開き、次のように実行します。

```text
/scenario-to-tyrano examples/simple/input.txt
```

出力先の`.ks`ファイルを指定することもできます。

```text
/scenario-to-tyrano examples/simple/input.txt data/scenario/chapter01.ks
```

出力先を省略した場合は、入力ファイルと同じ場所に同名の`.ks`ファイルを生成します。

変換例は [examples/](examples/) を参照してください。`input.txt`（自然言語のシナリオ）と`expected.ks`（期待されるティラノスクリプト）の対で構成されています。`literal-syntax`では、原文の記号をティラノの制御構文に誤解釈させない変換例を示します。

## 名称変更履歴

本プロジェクトは当初 `voice-to-tyrano` として開始しました。音声は入力方法の一つにすぎず、本質は自然言語からの変換であるため、`scenario-to-tyrano` へ改名しました。

## ドキュメント

- [docs/design.md](docs/design.md) — 解決する問題と設計上の中心
- [docs/conversion-policy.md](docs/conversion-policy.md) — 変換時の判断原則
- [docs/migration-from-tsumugai.md](docs/migration-from-tsumugai.md) — 前身プロジェクト`tsumugai`からの知識移行の記録
- [tests/README.md](tests/README.md) — 将来的なテスト観点

## 自動レビュー

Draftでない同一リポジトリ内のPull Requestに対し、[`kosuke-fujisawa/ai-review-action`](https://github.com/kosuke-fujisawa/ai-review-action) を実行します。実行には、GitHub ActionsのリポジトリSecret `OPENAI_API_KEY` が必要です。利用モデルはリポジトリVariable `AI_REVIEW_MODEL` で上書きでき、未設定時は `gpt-5-mini` を使います。

ワークフローは [`.github/workflows/ai-review.yml`](.github/workflows/ai-review.yml)、リポジトリ固有のレビュー方針は [`.github/ai-review-instructions.md`](.github/ai-review-instructions.md) で管理します。

## ライセンス

[MIT License](LICENSE)
