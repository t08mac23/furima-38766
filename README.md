# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

## アソシエーション

has_many items
has_many orders

## items

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item_name          | string     | null: false |
| description        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| prefecture_id      | integer    | null: false |
| delivery_date_id   | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

## アソシエーション

has_one order
belongs_to user

## orders

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## アソシエーション

has_one delivery
belongs_to user
belongs_to item

## deliveries

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false |
| address1           | string     | null: false |
| address2           | string     | null: false |
| building           | string     |
| phone_number       | string     | null: false |
| order              | references | null: false, foreign_key: true |

## アソシエーション

belongs_to order
