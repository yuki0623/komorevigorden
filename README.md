# komorevigorden

環境や立場が故に声を上げ辛い方々が心の内を話せる場になるWEBアプリケーション
・テスト用アカウントユーザー名 name:gests, email:gests@com, pass:gests0623


# 開発環境
・ ruby 2.5.1
・ Rails 5.2.4.3
・ MYSQL
・ heroku


# Purpose
・ 表立って相談できない人達が本音を話せる場にするため
・ 様々な事情を抱え誰にも相談できずに抱え込んでしまう人達が、人に話すことによって見つめ直し後悔しない選択ができるようにするため
・ このアプリを通し、４つのことを今後大事にしてほしいため
   * 自分で自分の価値を下げないこと
   * 自分に自信を持ち、等身大の自分を肯定してほしい
   * 現状は自分で変えることができると考えられるようになってほしい
   * 人に認めてもらう必要のない安心感、自信、自己肯定感を覚えてほしい


# Description
・ ユーザー登録機能
・ カルテ登録機能
・ チャット機能


# Usage

1.ユーザー登録機能について























## hostテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|text|null: false|
|password|integer|null: false, foreign_key: true|
|hostpassword|integer|null: false, foreign_key: true|
|profile|text||
|id|string|null: false, unique: true|

## Association
- has_many :casts
- has_many :gests
<!-- - has_many :groups, through: :groups_users
- has_many :groups_users -->
- has_many :messages
- has_many :kartes



## castsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|text|null: false|
|password|integer|null: false, foreign_key: true|
|profile|text||
|id|string|null: false, unique: true|

## Association
- belongs_to :host
- has_many :gests
<!-- - has_many :groups, through: :groups_users
- has_many :groups_users -->
- has_many :messages
- has_many :kartes



## gestsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|age|string|null: false|
|from|string|null: false|
|birthday|decimal|null: false|
|email|text|null: false|
|password|integer|null: false, foreign_key: true|
|nickname|string|null: false|
|remarks|text||
|id|string|null: false, unique: true|

## Association
- belongs_to :host
- belongs_to :casts
<!-- - has_many :groups, through: :groups_users
- has_many :groups_users -->
- has_many :messages
- has_one :kartes



<!-- ## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|host_id|integer|null: false, foreign_key: true|
|casts_id|integer|null: false, foreign_key: true|
|gests_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :host
- belongs_to :casts
- belongs_to :gests



## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :host,through: :groups_users
- has_many :casts,through: :groups_users
- has_many :gests,through: :groups_users
- has_many :groups_users
- has_many :messages
- has_many :kartes -->



## kartesテーブル
|Column|Type|Options|
|------|----|-------|
|consultation content|text|null: false|
|physical condition|text|null: false|
|hearing|text|null: false|
|id|string|null: false, unique: true|
|host_id|references|null: false, unique: true|
|cast_id|refarences|null: false, unique: true|
|gest_id|refarences|null: false, unique: true|

## Association
- belongs_to :host
- belongs_to :casts
- belongs_to :gests
- has_many :messages



## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|image|text||
|host_id|references|null: false, unique: true|
|cast_id|refarences|null: false, unique: true|
|gest_id|refarences|null: false, unique: true|
|group_id|refarences|null: false, foreign_key: true|
## Association
- belongs_to :host
- belongs_to :casts
- belongs_to :gests
<!-- - belongs_to :group -->
- belongs_to :kartes

