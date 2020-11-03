# README

# テーブル設計

## users テーブル

| Column       | Type    | Options                   |
| ------------ | ------- | ------------------------- |
| nickname     | string  | null: false               |
| email        | string  | null: false, unique: true |
| password     | string  | null: false               |
| name         | string  | null: false               |
| name_reading | string  | null: false               |
| birth_day_id | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | -----------| -------------------------------|
| image            | text       | null: false                    |
| item_name        | string     | null: false                    | 
| item_description | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| ship_method_id   | integer    | null: false                    |
| consignor_id     | integer    | null: false                    |
| days_to_ship_id  | integer    | null: false                    |
| amount_sold      | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :addresses

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postalcode     | integer    | null: false                    |
| state_id       | integer    | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | integer    | null: false                    |
| purchase_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase