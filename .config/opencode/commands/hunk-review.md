---
description: 開いている hunk セッション上で変更をレビューする [ref|range]
agent: build
---

hunk-review スキルを読み込み、その手順に従って、開いている Hunk セッション上で変更をレビューしてください。

Input: $ARGUMENTS

## 手順

1. `hunk session list` でセッションを探す。見つからなければ、ターミナルで `hunk diff --watch` を起動するよう伝えて止まる。複数ある場合は `--repo .` で今のリポジトリのセッションを選ぶ
2. 引数に応じて表示を切り替える
   - 引数なし: 今の表示のまま
   - コミット 1 つ（例: `HEAD`、ハッシュ）: `hunk session reload --repo . -- show <ref>`
   - 範囲（例: `main...HEAD`）: `hunk session reload --repo . -- diff <range>`
3. `hunk session review --repo . --json` でファイルと hunk の構成を把握し、必要なファイルだけ `--include-patch` で差分を読む。差分だけで判断せず、変更されたファイル全体も読んで文脈を確認する
4. 次の観点でレビューする
   - バグ: ロジックの誤り、境界値、null／空入力、エラー処理の漏れ、セキュリティ上の問題
   - 挙動の変化: 意図していない可能性のある挙動の変化
   - 構造: 既存の書き方や抽象化との食い違い
   - 変更された部分だけを見る。確信のない指摘はせず、迷う場合は「確信が持てません」と明記する。スタイルの好みは指摘しない
5. 指摘は日本語で書き、`hunk session comment apply --repo . --stdin --focus` でまとめて該当行にノートとして残す
6. 最後に、指摘の一覧（ファイル・行・要点・重大度）を日本語で短く要約する

コードの修正やコミットは行わないこと。
