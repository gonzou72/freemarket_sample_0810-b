## usersテーブル
| Column          | Type    | Options                   |
| --------------- | ------- | ------------------------- |
| nickname        | string  | null: false, unique: true |
| email           | string  | null: false, unique: true |
| password        | string  | null: false               |
| last_name       | string  | null: false               |
| first_name      | string  | null: false               |
| last_name_kana  | string  | null: false               |
| first_name_kana | string  | null: false               |
| birth_day       | integer | null: false               |
| postal_code     | integer | null: false               |
| prefecture      | string  | null: false               |
| city            | string  | null: false               |
| street          | string  | null: false               |
| building_name   | string  |                           |
| phone           | integer |                           |
| card_number     | integer | null: false               |
| valid_month     | integer | null: false               |
| valid_year      | integer | null: false               |
| security_code   | integer | null: false               |
| profile_picture | string  |                           |
| profile_text    | text    |                           |
| selling_items   | string  |                           |
| sold_items      | string  |                           |
| purchased_items | string  |                           |
### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :rates
- has_many :news
- has_many :todos
- has_many :buyers


## itemsテーブル
| Column        | Type    | Option                         |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| details       | text    | null: false                    |
| price         | integer | null: false                    |
| condition     | string  | null: false                    |
| shipping_fee  | integer | null: false                    |
| ship_out_area | string  | null: false                    |
| ship_out_date | integer | null: false                    |
| user_id       | integer | null: false, foreign_key: true |
| brand_id      | integer | null: false, foreign_key: true |
| trade_id      | integer | null: false, foreign_key: true |
## Association
- belongs_to :user
- belongs_to :barnd
- has_many :images
- has_many :comments
- has_many :likes
- has_many :categories, through: items_categories

## buyersテーブル
| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |
## Association
- belongs_to :user


## commentsテーブル
| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| comment | text    |                                |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |
## Association
- belongs_to :item
- belongs_to :user


## imagesテーブル
| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| image   | string  | null :false                    |
| item_id | integer | null: false, foreign_key: true |
## Association
- belongs_to :item


## brandsテーブル
| Column | Type   | Option      |
| ------ | ------ | ----------- |
| name   | string | null: false |
## Association
- has_many :items


## items_categoriesテーブル
| Column      | Type    | Option                         |
| ----------- | ------- | ------------------------------ |
| item_id     | integer | null: false, foreign_key: true |
| category_id | integer | null: false, foreign_key: true |
## Association
- belongs_to :item
- belongs_to :category


## categoriesテーブル
| Column    | Type    | Option                         |
| --------- | ------- | ------------------------------ |
| name      | string  |                                |
| parent_id | integer | null: false, foreign_key: true |
## Association
- has_many :items, through: items_categories


## tradesテーブル
| Column | Type   | Option |
| ------ | ------ | ------ |
| status | string |        |
## Association
- has_many :trade_comments


## trade_commentsテーブル
| Column   | Type    | Option                         |
| -------- | ------- | ------------------------------ |
| comment  | text    |                                |
| trade_id | integer | null: false, foreign_key: true |
## Association
- belongs_to :trade


## likesテーブル
| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |
## Association
- belongs_to :item
- belongs_to :user


## ratesテーブル
| Column   | Type    | Option                         |
| -------- | ------- | ------------------------------ |
| status   | string  | null: false                    |
| trade_id | integer | null: false, foreign_key: true |
| user_id  | integer | null: false, foreign_key: true |q
## Association
- belongs_to :user


## todosテーブル
| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| title   | text    | null: false                    |
| text    | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
- belongs_to :user

## newsテーブル
| Column  | Type    | Option                         |
| ------- | ------- | ------------------------------ |
| title   | text    | null: false                    |
| text    | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
- belongs_to :user