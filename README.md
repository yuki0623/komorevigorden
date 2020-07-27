# komorevigorden

環境や立場が故に声を上げ辛い方々が心の内を話せる場になるWEBアプリケーション

* テスト用アカウントユーザー名 name:gests, email:gests@com, pass:gests0623


### 開発環境
* ruby 2.5.1
* Rails 5.2.4.3
* MYSQL
* heroku


### Purpose
* 表立って相談できない人達が本音を話せる場にするため
* 様々な事情を抱え誰にも相談できずに抱え込んでしまう人達が、人に話すことによって見つめ直し後悔しない選択ができるようにするため
* このアプリを通し、４つのことを今後大事にしてほしいため
   * 自分で自分の価値を下げないこと
   * 自分に自信を持ち、等身大の自分を肯定してほしい
   * 現状は自分で変えることができると考えられるようになってほしい
   * 人に認めてもらう必要のない安心感、自信、自己肯定感を覚えてほしい


### Description
* ユーザー登録機能
* カルテ登録機能
* チャット機能


### Usage

### 1.ユーザー登録機能について
名前、Email、Passwordでユーザーの新規登録ができます。
今後、登録した情報をマイページから確認できるよう実装予定です。

### 2.カルテ登録機能について
ゲストユーザーがキャストとの相談前に、問診票のようなカルテを入力送信することができます。
中身にはニックネームや年齢、お住まいの地域などのプロフィール欄と、相談内容などのヒアリング項目があり、決定ボタンを押すとカルテがキャストに送信され、それをもとにチャットでお話をします。

### 3.チャット機能について
カルテが送信されると、チャットが行えるようになります。
キャストは受け取ったカルテをもとにヒアリング形式でゲストユーザーとお話をします。
今後、メッセージのみでなく画像の送信も行えるよう実装予定です。

### 4.制作背景
自分の妊娠や出産、友人の妊娠や家庭事情を機にもっと心理的にも環境的にも、助けてほしい時に助けてと言える環境があれば良いのではないかと考えました。
真面目な人ほど抱え込んでしまうし、そんな自分に罪悪感を持ってしまう方は多いと感じていたので、そういった方に寄り添い、後悔のない選択ができるよう一緒に話し合いを重ねて行けたらとこのアプリケーションの開発を行いました。


### 今後の実装予定
* 登録した情報をマイページから確認できる
* メッセージのみでなく画像の送信も行える
* 通話機能
* 予約機能



# komorevigorden DB設計


## hostテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|text|null: false|
|password|integer|null: false, foreign_key: true|
|hostpassword|integer|null: false, foreign_key: true|
|profile|text||
|id|string|null: false, unique: true|

### Association
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

### Association
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

### Association
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

### Association
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

### Association
- belongs_to :host
- belongs_to :casts
- belongs_to :gests
<!-- - belongs_to :group -->
- belongs_to :kartes

