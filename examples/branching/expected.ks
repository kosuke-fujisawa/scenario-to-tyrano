; scenario-to-tyrano により examples/branching/input.txt から生成した初稿
; 作者による確認・編集を前提とする

*start

; TODO(author): 場面「昼休みの購買前」に対応する背景素材ファイル名が不明
; [bg storage="" time=1000]

; TODO(author): キャラクター「美咲」の立ち絵素材が不明
; [chara_show name="misaki"]

#
昼休みの購買前。美咲が二つのパンを持って立っている。[p]

#美咲
「どっちがいいと思う？　カレーパンとメロンパン」[p]

[glink target="*choice_currypan" text="カレーパンと答える" x=260 y=200]
[glink target="*choice_melonpan" text="メロンパンと答える" x=260 y=300]
[s]

*choice_currypan
; TODO(author): 「好感度」の既存変数名と初期値を確認できないため、加算処理を確定できない
; 「好感度」を f.affection として仮置き
; [eval exp="f.affection = f.affection + 1"]

#美咲
「私もそう思ってた」[p]

[jump target=*after_choice]

*choice_melonpan

#美咲
「ふうん、そっちなんだ」[p]

[jump target=*after_choice]

*after_choice

#
二人で購買の列に並んだ。[p]

[s]
