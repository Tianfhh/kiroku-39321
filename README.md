[![Image from Gyazo](https://i.gyazo.com/e6871ce5782c3c1802b0baa97ad7bc3a.png)](https://gyazo.com/e6871ce5782c3c1802b0baa97ad7bc3a)


## usersテーブル
  
| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| name               | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |


### Association

- has_many :entries
- has_many :likes
- has_many :comments

- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower

- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following


## entriesテーブル
  
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| photo   | string     | null: false                    |
| title   | integer    | null: false                    |
| text    | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :likes
- has_many :comments


## followersテーブル
  
| Column    | Type    | Options      |
| --------- | ------- | ------------ |
| id        | integer | null: false  |
| name      | integer | null: false  |
| email     | integer | null: false  |
| password  | integer | null: false  |


### Association
- belongs_to :follower, class_name: "User"


## followingsテーブル
  
| Column    | Type     | Options      |
| --------- | -------- | ------------ |
| id        | integer  | null: false  |
| name      | integer  | null: false  |
| email     | integer  | null: false  |
| password  | integer  | null: false  |


### Association
- belongs_to :following, class_name: "User"


## relationshipsテーブル
  
| Column        | Type     | Options      |
| ------------- | -------- | ------------ |
| id            | integer  | null: false  |
| following_id  | integer  | null: false  |
| follower_id   | integer  | null: false  |


### Association
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id



## likesテーブル
  
| Column   | Type     | Options                         |
| -------- | -------- | ------------------------------- |
| like_id  | integer  | null: false, foreign_key: true  |
| user_id  | integer  | null: false, foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :entry




## commentsテーブル
  
| Column    | Type     | Options      |
| --------- | -------- | ------------ |
| text      | integer  | null: false  |
| user_id   | integer  | null: false  |
| entry_id  | integer  | null: false  |


### Association

- belongs_to :user
- belongs_to :entry


