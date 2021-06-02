# アプリケーション名
  knots(ノッツ)

# アプリケーション概要
  相談したいことを投稿すると寄付金とアドバイスをもらえる。

# テスト用アカウント
  現段階ではユーザー登録機能未実装

# 利用方法
  このアプリケーションには相談者と相談に乗る人がいます。相談者は相談したいことを投稿ページから投稿できます。相談に乗る人は投稿されている相談にコメントすることができます。ただし、コメントするためにはお金が必要になります。

# 目指した課題解決
  ・立ち上げたいプロジェクトはあるが、相談する人もプロジェクトを立ち上げられるお金もない人がアドバイスや資金をもらうことができる。

  ・投資や人助けをしたい富裕層や困っている人にお金を出せる人、アドバイスしたい人にとってのまとめサイトになる

# 洗い出した要件
  https://docs.google.com/spreadsheets/d/1FitFfMRoKfV4P39euat3KS4Nl6W4CVM9TP2PvJPwX70/edit?usp=sharing

# 実装機能の詳細
## トピック一覧
   [![Image from Gyazo](https://i.gyazo.com/0d7d76a2e977275d8c3c1c422797754b.png)](https://gyazo.com/0d7d76a2e977275d8c3c1c422797754b)
## トピック詳細ページ表示機能
   [![Image from Gyazo](https://i.gyazo.com/5798eb53c89b565bb6956dc3568bbe96.jpg)](https://gyazo.com/5798eb53c89b565bb6956dc3568bbe96)
## トピック編集機能
   [![Image from Gyazo](https://i.gyazo.com/d02f219d95fb4352a76535692ea3a61e.jpg)](https://gyazo.com/d02f219d95fb4352a76535692ea3a61e)

# 実装予定機能
## メッセージ送信機能（寄付機能）
## ユーザー管理機能
## バリデーション

# ER図
  [![Image from Gyazo](https://i.gyazo.com/8ac9a968b5fe62ba979e708edd7e43f3.png)](https://gyazo.com/8ac9a968b5fe62ba979e708edd7e43f3)

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :topics
- has_many :comments

## topics テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| topic_name     | string     | null: false                    |
| topic_content  | text       | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| topic   | references | null: false, foreign_key: true |

### Association

- belongs_to :topic
- belongs_to :user
- has_one :donation


## donations テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |
| comment   | references | null: false, foreign_key: true |

### Association

- belongs_to :comment