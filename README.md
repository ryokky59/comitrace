# Comitrace
====

https://user-images.githubusercontent.com/42271756/46590740-a2609300-caf0-11e8-89e5-283a62d3b0d5.png

## 概要
SNS型スケジュール共有アプリです。
自分の1日の時間の使い方をみんなに公開できます。
また、公開して自分もやりたいと思ったものを自分のスケジュールとする事ができます。

## デプロイ
https://comitrace.herokuapp.com/

## 開発環境
・Ruby 2.3.1
・Ruby on Rails 5.1.6
・Bootstrap 4.1.3
・jQuery 3.3.1
・PostgreSQL 10.2

## 使い方
###サインアップ
トップ画面で「今すぐ無料で始める」からサインアップしてください。

###スケジュール作成
右上のメニュー画面の「スケジュール作成」で作成画面に入れます。
タイトル、内容、予定、開始時間、終了時間を入力していきます。
予定は「追加」で項目を増やす事ができ、最大15個まで増やせます。
予定の時間を全て計算して24時間でなかったり、一つの予定の時間が15時間以上だと不正な値となり、登録できません。
全ての項目に入力し「確認」を押すと投稿確認画面に移動します。
確認後、「投稿」で投稿する事ができます。

###スケジュール画面
スケジュール画面ではコメントやいいねをする事ができます。
自分のスケジュールであれば編集や削除ができます。
「Trace」を押す事で、マイページに実行中のスケジュールとして登録する事ができます。

## インストール
1. `$ cd [ダウンロードしたいディレクトリ名]`
2. `$ git clone git@github.com:ryokky59/comitrace.git`
3. `$ cd comitrace/`
4. `$ bundle install`
5. Yarnを使って Bootstrap, jqueryの導入 Yarnをインストールしてなければ下記サイトからインストールしてください。
https://yarnpkg.com/lang/en/
`$ yarn add jquery`
`$ yarn add bootstrap@4`
6. `$ rails db:create`
7. `$ rails db:migrate`
8. `$ rails server`
9. http://localhost:3000/ にアクセス
