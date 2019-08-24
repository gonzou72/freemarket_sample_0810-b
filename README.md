# データベース設計

## usersテーブル

| Column          | Type    | Options                                |
| --------------- | ------- | -------------------------------------- |
| nickname        | string  | index: true, null: false, unique: true |
| email           | string  | null: false, unique: true              |
| password        | string  | null: false                            |
| last_name       | string  | null: false                            |
| first_name      | string  | null: false                            |
| last_name_kana  | string  | null: false                            |
| first_name_kana | string  | null: false                            |
| birth_day       | date    | null: false                            |
| profile_picture | string  |                                        |
| profile_text    | text    |                                        |
|                 |         |                                        |

Association

- has_many :items
- has_many :comments
- has_many :likes
- has_many :ratings
- has_many :news
- has_many :todos
- has_many :buyers
- has_many :addresses
- has_many :credit_cards

---

## itemsテーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| details         | text       | null: false                    |
| price           | integer    | null: false                    |
| condition       | string     | null: false                    |
| shipping_fee    | integer    | null: false                    |
| shipping_method | string     | null: false                    |
| ship_out_area   | string     | null: false                    |
| ship_out_date   | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| brand_id        | references | null: false, foreign_key: true |
| trade_id        | references | null: false, foreign_key: true |
|                 |            |                                |

Association

- belongs_to :user
- belongs_to :brand
- has_many :images
- has_many :comments
- has_many :likes
- has_many :categories, through: :item_categories
- has_one :trade
- has_many :delivery_methods

---

## buyersテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
|         |            |                                |

Association

- belongs_to :user
- belongs_to :item
- has_many :ratings

---

## commentsテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
|         |            |                                |

Association

- belongs_to :item
- belongs_to :user

## imagesテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| image   | string     | null :false                    |
| item_id | references | null: false, foreign_key: true |
|         |            |                                |

Association

- belongs_to :item

---

## brandsテーブル

| Column | Type   | Option                   |
| ------ | ------ | ------------------------ |
| name   | string | index: true, null: false |
|        |        |                          |

Association

- has_many :items

---

## item_categoriesテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| category_id | references | null: false, foreign_key: true |
|             |            |                                |

Association

- belongs_to :item
- belongs_to :category

---

## categoriesテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| name      | string     |                                |
| parent_id | references | null: false, foreign_key: true |
|           |            |                                |

Association

- has_many :items, through: :item_categories

---

## delivery_methodテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
|         |            |                                |

Association

- belongs_to :item

## tradesテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| status  | string     |                                |
| item_id | references | null: false, foreing_key: true |
|         |            |                                |

Association

- has_many :trade_comments
- belongs_to :item
- has_one :rating

---

## trade_commentsテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| comment  | text       |                                |
| trade_id | references | null: false, foreign_key: true |
|          |            |                                |

Association

- belongs_to :trade

---

## likesテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
|         |            |                                |

Association

- belongs_to :item
- belongs_to :user

---

## ratingsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| buyer_id      | references | null: false, foreign_key: true |
| seller_rating | string     | null: false                    |
| buyer_rating  | string     | null: false                    |
| trade_id      | references | null: false, foreign_key: true |
|               |            |                                |

Association

- belongs_to :user
- belongs_to :buyer
- has_one :trade

---

## todosテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| title   | text       | null: false                    |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
|         |            |                                |

Association

- belongs_to :user

## newsテーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| title   | text       | null: false                    |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
|         |            |                                |

Association

- belongs_to :user

---

## addressテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| street          | string     | null: false                    |
| building_name   | string     |                                |
| phone           | string     |                                |
| user_id         | references | null: false, foreign_key: true |

Association

- belongs_to :user

---

## credit_cardテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| valid_month     | integer    | null: false                    |
| valid_year      | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
|                 |            |                                |

Association

- belongs_to :user
