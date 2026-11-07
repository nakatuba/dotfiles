---
description: hunk セッションで自分が書いたノートに沿って修正する
agent: build
---

hunk-review スキルを読み込み、開いている Hunk セッションで私が書いたノートに沿ってコードを修正してください。

Input: $ARGUMENTS

## 手順

1. `hunk session list` でセッションを探す。見つからなければ、ターミナルで `hunk diff --watch` を起動するよう伝えて止まる
2. `hunk session comment list --repo . --type user --json` で私が書いたノートを取得する。ノートがなければその旨を伝えて止まる
3. ノートごとに、対象のファイルと行を読んで修正する
   - 修正したら `hunk session comment add --repo . --reply-to <note-id> --summary "..."` で、何をどう直したかを日本語で返信する
   - 方針が分かれる指摘や、修正内容に迷う指摘は直さず、返信で質問を残す
4. 最後に、修正したノートと保留したノート（質問内容つき）を日本語で一覧にして報告し、保留分の判断を確認する

git commit は行わず、変更は作業ツリーに残したままにすること。
