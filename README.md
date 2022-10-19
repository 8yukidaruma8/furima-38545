# README

## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false, unique: true|
| encrypted_password | string   | null: false              |
| first_name         | string   | null: false              |
| family_name        | string   | null: false              |
| first_name_kana    | string   | null: false              |
| family_name_kana   | string   | null: false              |
| date_of_birth      | datetime | null: false              |

### Association
- has_many : items
- has_many : purchases


## items テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| item_image         | string   | null: false              |
| item_name          | string   | null: false              |
| Description        | text     | null: false              |
| category           | string   | null: false              |
| item_situation     | string   | null: false              |
| price              | integer  | null: false              |

### Association
- belongs to : users
- has_one : purchases


## purchases テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| delivery_load      | string   | null: false              |
| sender_area        | string   | null: false              |
| sender_days        | datetime | null: false              |

### Association
- belongs to : users
- belongs to : items
- has_one : addresses


## addresses　テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| post_code          | string  | null: false              |
| prefectures        | string  | null: false              |
| municipalities     | string  | null: false              |
| address            | string  | null: false              |
| Building_name      | string  |                          |
| phone_number       | integer | null: false              |

### Association
- belongs to : purchases
