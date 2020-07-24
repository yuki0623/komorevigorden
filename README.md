# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
- has_many :groups, through: :groups_users
- has_many :groups_users
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
- has_many :groups, through: :groups_users
- has_many :groups_users
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
- has_many :groups, through: :groups_users
- has_many :groups_users
- has_many :messages
- has_one :kartes



## groups_usersテーブル

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
- belongs_to :group
- has_many :messages



## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|sentences|text|null: false|
<!-- |send-date-and-time|datetime|null: false| -->
|image|string||
|id|string|null: false, unique: true|
|host_id|references|null: false, unique: true|
|cast_id|refarences|null: false, unique: true|
|gest_id|refarences|null: false, unique: true|
|group_id|refarences|null: false, foreign_key: true|
## Association
- belongs_to :host
- belongs_to :casts
- belongs_to :gests
- belongs_to :group
- belongs_to :kartes

