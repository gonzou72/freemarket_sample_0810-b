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
| purchased_items | string  |                           |
| purchased_items | string  |                           |

### Association
- has_many :items
- has_many :comments
- has_many :likes
- has_many :rates
- has_many :news
- has_many :todos

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
