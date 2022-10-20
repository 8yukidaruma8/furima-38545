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
| item_name          | string   | null: false              |
| description        | text     | null: false              |
| category           | integer  | null: false              |
| item_situation_id  | integer  | null: false              |
| delivery_load      | integer  | null: false              |
| prefectures        | integer  | null: false              |
| sender_days        | integer  | null: false              |
| price              | integer  | null: false              |
| user_id            | string   | null: false              |

### Association
- belongs to : user
- has_one : purchases


## purchases テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| user_id            | string   | null: false              |
| item_id            | string   | null: false              |

### Association
- belongs to : user
- belongs to : item
- has_one : address


## addresses　テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| post_code          | integer  | null: false              |
| prefectures        | string   | null: false              |
| municipalitie      | integer  | null: false              |
| address            | string   | null: false              |
| building_name      | string   |                          |
| phone_number       | string   | null: false              |


### Association
- belongs to : purchase
