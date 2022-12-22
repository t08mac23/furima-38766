# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false |
| full_name          | string  | null: false |
| full_name_kana     | string  | null: false |
| birthday           | integer | null: false |

## アソシエーション

has_many items
has_many orders

## items

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition          | string     | null: false |
| delivery_charge    | string     | null: false |
| delivery_place     | string     | null: false |
| delivery_date      | string     | null: false |
| price              | integer    | null: false |
| user_id            | references | null: false, foreign_key: true |

## アソシエーション

has_one order
belongs_to user

## orders

| Column                | Type       | Options     |
| ------------------    | ------     | ----------- |
| user_id               | references | null: false, foreign_key: true |
| item_id               | references | null: false, foreign_key: true |

## アソシエーション

has_one delivery
belongs_to user
belongs_to item

## deliveries

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| postal_code        | integer    | null: false |
| prefecture         | string     | null: false |
| address1           | string     | null: false |
| address2           | string     | null: false |
| building           | string     |
| phone_number       | integer    | null: false |
| order_id           | references | null: false, foreign_key: true |

## アソシエーション

belongs_to order
