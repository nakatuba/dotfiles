---
name: commit
description: Stage changes and create a git commit
disable-model-invocation: true
---

`git status` と `git diff` を実行して、このプロジェクトの変更を確認してください。

## 手順

1. `git diff --staged` でステージ済みの変更を確認し、`git status` で全体の状態を確認する
2. `git log --oneline -5` を実行し、最近の commit メッセージの書き方をつかむ
3. commit に使う変更を決める
   - ステージ済みの変更がある場合は、その変更だけを使い、ほかのファイルを追加でステージしないこと
   - ステージ済みの変更がない場合は、関係する変更を `git add` でステージする
   - 秘密情報を含んでいそうなファイル（.env、credentials など）はステージしないこと
4. 次の条件を満たす簡潔な commit メッセージを考える
   - このリポジトリの既存の commit メッセージの書き方に合わせる
   - 「何を」よりも「なぜ」に重点を置く
   - 長くても 1〜2 文にする
   - 全角文字（日本語など）と半角文字（英数字など）の間に半角スペースを入れる（例: 「修正 API のレスポンス」）
5. `git commit -m "..."` で commit を作る
6. `git status` を実行し、commit が成功したことを確認する
7. リモートリポジトリに push しないこと

$ARGUMENTS
