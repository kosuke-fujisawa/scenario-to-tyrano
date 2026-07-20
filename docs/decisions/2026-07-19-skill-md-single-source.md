# 変換規則の正本をSKILL.mdに一本化し、conversion-policy.mdを廃止する

- Status: Accepted
- Date: 2026-07-19
- Scope: 変換規則の記載場所(`.claude/skills/scenario-to-tyrano/SKILL.md` と `docs/`)

## Context / 解決したい問題

エスケープ規則・原文保持・素材名/変数/遷移先の扱いなどの変換規則が、`SKILL.md` と `docs/conversion-policy.md` にほぼ同内容で二重記載されていた。規則を変更・拡張するたびに2箇所の更新が必要で、片方だけ更新されてドリフトするリスクがあった(Single Source of Truth違反)。[Confirmed]

## Decision / 採用した判断

変換規則の正本を `SKILL.md` に定め、`docs/conversion-policy.md` の未統合分(誤変換もTODO化・実行時表示は原文一致・初稿コメント明示・「名前「発話」」形式の解釈)を `SKILL.md` へ取り込んだ上で同ファイルを削除した。README・AGENTS.mdの参照は `SKILL.md` へ付け替えた。[Confirmed]

## Invariants / 守る性質

- 変換規則(手順・規則レベルの記述)を読む場所・更新する場所は `SKILL.md` の1箇所のみ
- `SKILL.md` は単体で完結する(他プロジェクトへ配置されても `docs/` なしで機能する)

## Rationale / 採用理由

- [Confirmed] `SKILL.md` は他のティラノプロジェクトへ配置されて使われる前提のため自己完結が必須であり、規則の正本は構造上 `SKILL.md` 側にしかなり得ない
- [Confirmed] 保守性よりアーキテクチャのシンプルさを優先する方針(2026-07-19のリファクタリングレビューでユーザーが指定)に対し、規則を読む場所が1つになる本案が最もシンプル

## Alternatives considered / 比較した代替案

1. conversion-policy.mdから具体的規則を削り、「なぜその原則か」の背景説明のみ残す案
2. 二重記載を許容する現状維持案

(いずれも本会話のAskUserQuestionで実際に提示・比較した)

## Why alternatives were not chosen / 不採用理由

1. why専用文書化: 規則と理由で読む場所が2つに分かれ、リンク切れ・記述齟齬の管理が残る。whyの中心は既にdocs/design.mdが担っている [Confirmed]
2. 現状維持: ドリフトリスクが拡張のたびに増える。ユーザーが統合・削除案を選択した [Confirmed]

## Business constraints / 業務制約

Not applicable

## Technical constraints / 技術制約

- Claude Code Skillは実行時に `SKILL.md` を読み込む。リポジトリ外へ配置された場合 `docs/` は参照できないため、実行時規則はすべて `SKILL.md` 内に必要 [Confirmed]

## Intentional irregularities / 意図的な不自然さ

- 「独自DSLを作らない」等の1行レベルの方針表明は、README・AGENTS.md・docs/design.mdに引き続き重複して現れる。読者(利用者/AIエージェント/設計文書の読者)が異なるための意図的な許容であり、解消対象は手順・規則レベルの重複のみ [Confirmed]

## Change boundaries / 変更可能な範囲と固定する範囲

- 変更してよい: 方針表明レベルの文言を各文書の読者に合わせて言い換えること
- 守る(固定): エスケープ手順・検査項目・TODO形式などの規則を `SKILL.md` 以外に再度記載しないこと

## Consequences and trade-offs / 帰結とトレードオフ

- `SKILL.md` が規則追加のたびに長くなる(現在約220行)。人間向けの読みやすさより一本化を優先した

## Revisit conditions / 再検討条件

- `SKILL.md` が肥大化し、Skillのreferences/分割(補助ファイルの遅延読み込み)が必要になったとき
- 変換規則を人間の作者向けに独立した文書で解説する必要が確認されたとき

## Verification / どこで、何を検証するか

- `rg -n "conversion-policy" --glob "!docs/decisions/**" .` で、設計判断履歴を除く現行ファイルから参照が見つからないこと
- `SKILL.md` を単体で読み、変換に必要な規則がすべて含まれていること(examples/の期待出力を再現できること)

## Evidence / 根拠

- 本判断はPR https://github.com/kosuke-fujisawa/scenario-to-tyrano/pull/2 (コミット c9d73bf) で実施
- 2026-07-19の会話でリファクタリングレビューの結果として提案し、ユーザーが「統合して削除」案を明示的に選択

## Unknowns / 未確認事項

Not applicable
