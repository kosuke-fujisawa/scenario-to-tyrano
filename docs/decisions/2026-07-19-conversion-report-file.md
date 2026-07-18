# 変換の追跡可能性を、出力.ksの隣に書き出す変換レポート(.report.md)で確保する

- Status: Accepted
- Date: 2026-07-19
- Scope: Skillの変換手順と完了報告(`.claude/skills/scenario-to-tyrano/SKILL.md`)

## Context / 解決したい問題

完了報告(入出力パス・生成ラベル・分岐・TODO一覧・検査8項目の結果)が会話にのみ出力され、セッション終了後に失われていた。後から「何がどう変換されたか」「検査を通っていたか」を追跡できず、失敗時の原因調査が困難だった(Observable by Default違反)。[Confirmed]

## Decision / 採用した判断

変換のたびに、出力`.ks`と同じ場所へ変換レポートを書き出す手順を `SKILL.md` に追加した。ファイル名は出力`.ks`の拡張子を`.report.md`に置き換えたもの(例: `chapter01.ks` → `chapter01.report.md`)。レポートは派生物として手編集禁止とし、`.ks`本体と異なり上書き前の確認を不要とする。[Confirmed]

## Invariants / 守る性質

- 変換日時・入出力パス・生成ラベル/分岐・仮置き変数の対応表・未解決TODO・検査結果が、会話の外に永続化される
- レポートは派生物であり手動管理しない(Single Source of Truthは生成手順側)
- コード・検査スクリプトを追加しない(AGENTS.mdの「コード追加は明確な必要性が生じた場合のみ」を維持)

## Rationale / 採用理由

- [Confirmed] ログ基盤の整備と失敗時の追跡可能性が2026-07-19のリファクタリングレビューの要求観点であり、Skill手順の変更のみ(コード追加なし)で満たせる最小の手段として採用
- [Confirmed] ユーザーがAskUserQuestionで本案(レポートファイル出力)を明示的に選択

## Alternatives considered / 比較した代替案

1. 生成した`.ks`の冒頭コメントに検査結果・TODO件数を埋め込む案(別ファイルを増やさない)
2. 永続ログを設けず会話報告のみの現状維持案

(いずれも本会話のAskUserQuestionで実際に提示・比較した)

## Why alternatives were not chosen / 不採用理由

1. `.ks`冒頭コメント埋め込み: 記録できる情報量が絞られ、詳細な検査結果や仮置き対応表を残すと成果物である`.ks`がノイズで膨らむ [Confirmed]
2. 現状維持: 追跡不能の問題が解消されない [Confirmed]

## Business constraints / 業務制約

Not applicable

## Technical constraints / 技術制約

- 変換主体がLLM(Skill)であり、実行トレースを自動収集する仕組みがないため、追跡記録はSkill自身の手順として明文化する必要がある [Confirmed]

## Intentional irregularities / 意図的な不自然さ

- `.ks`は上書き前にユーザー確認が必要(手修正保護)だが、レポートは確認なしで上書きする。両者の扱いの非対称は「レポートは派生物、`.ks`は編集対象の成果物」という区別による意図的なもの [Confirmed]

## Known debt / 既知の負債

Not applicable

## Change boundaries / 変更可能な範囲と固定する範囲

- 変更してよい: レポートの記録項目の追加・書式の調整
- 守る(固定): 会話のみに報告して永続記録を残さない状態へ戻さないこと。レポートを手編集運用の対象にしないこと

## Consequences and trade-offs / 帰結とトレードオフ

- 出力先(作者のティラノプロジェクト等)にレポートファイルが1つ増える。不要なら作者が削除してよく、再変換で再生成される

## Revisit conditions / 再検討条件

- レポートファイルがティラノプロジェクトのビルド・配布物に混入して問題になることが確認されたとき(出力先の分離を検討)
- 検査スクリプトをコードとして実装する段階になったとき(レポート生成の責務をスクリプト側へ移すか判断)

## Verification / どこで、何を検証するか

- Skillを実行し、出力`.ks`と同じ場所に`.report.md`が生成され、記録9項目(日時・入出力・シーン・ラベル・分岐・仮置き変数・TODO・検査結果)が含まれること
- レポート冒頭に派生物・手編集禁止の明記があること

## Evidence / 根拠

- 本判断はPR https://github.com/kosuke-fujisawa/scenario-to-tyrano/pull/2 (コミット 0badcf1) で実施
- 2026-07-19の会話でユーザーがレポートファイル出力案を明示的に選択
- 手順の実行可能性は examples/simple/input.txt の試験変換で確認済み

## Unknowns / 未確認事項

Not applicable
