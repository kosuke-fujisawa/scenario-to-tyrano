# voice-to-tyrano

音声で語ったノベルゲームシナリオの文字起こしを、ティラノスクリプト（.ks）へ変換するClaude Code Skill。

作者がティラノスクリプトのタグや書式を逐一入力しなくても、音声で語ったシナリオからティラノスクリプトの初稿を生成できるようにします。完成品を自動生成するツールではなく、ティラノスクリプトで編集可能な初稿を生成する制作支援ツールです。

## ステータス

**初期段階の実験的Skill（v0.1）です。** 変換結果は必ず作者自身が確認・編集してください。

## 処理の流れ

```text
音声
↓
任意の音声認識機能
↓
文字起こしテキスト
↓
voice-to-tyrano
↓
.ks
↓
ティラノスクリプト
```

音声認識はこのリポジトリの責務外です。任意の音声認識機能で文字起こししたテキストファイルを入力にします。

## 本リポジトリが行うこと

- 文字起こしテキストの解釈
- セリフ、地の文、場面、演出、分岐、状態変化、遷移の抽出
- `.ks`ファイルの生成
- 最低限の構造確認（ラベル重複、未定義ジャンプ先など）

## 行わないこと

- 独自ノベルゲームエンジン・独自ランタイムの実装
- 独自シナリオ記法（DSL）の定義
- GUI、音声録音、音声認識APIとの連携
- ティラノビルダーの改造、ティラノのランタイムプラグイン
- AIによるシナリオ本文の創作、原稿の推敲や書き換え
- 作者の意図の無断補完（判断できない箇所はTODOとして残します）

## 使用方法

Claude Code でこのリポジトリ（またはSkillを配置したプロジェクト）を開き、次のように実行します。

```text
/voice-to-tyrano examples/simple/input.txt
```

出力先の`.ks`ファイルを指定することもできます。

```text
/voice-to-tyrano examples/simple/input.txt data/scenario/chapter01.ks
```

出力先を省略した場合は、入力ファイルと同じ場所に同名の`.ks`ファイルを生成します。

変換例は [examples/](examples/) を参照してください。`input.txt`（音声で語った文字起こし）と`expected.ks`（期待されるティラノスクリプト）の対で構成されています。

## ドキュメント

- [docs/design.md](docs/design.md) — 解決する問題と設計上の中心
- [docs/conversion-policy.md](docs/conversion-policy.md) — 変換時の判断原則
- [docs/migration-from-tsumugai.md](docs/migration-from-tsumugai.md) — 前身プロジェクト`tsumugai`からの知識移行の記録
- [tests/README.md](tests/README.md) — 将来的なテスト観点

## ライセンス

[MIT License](LICENSE)
