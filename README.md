# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

## items

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| item_name          | string     | null: false |
| category           | string     | null: false |
| price              | string     | null: false |
| user               | references | null: false, foreign_key: true |

## orders

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## deliveries

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| postal_code        | string     | null: false |
| prefecture         | string     | null: false |
| address            | string     | null: false |
| order              | references | null: false, foreign_key: true |
