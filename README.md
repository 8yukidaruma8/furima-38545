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
| date_of_birth      | date     | null: false              |
### Association
- has_many : items
- has_many : purchases

## items テーブル
| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| item_name          | string   | null: false              |
| description        | text     | null: false              |
| category_id        | integer  | null: false              |
| item_situation_id  | integer  | null: false              |
| delivery_load_id   | integer  | null: false              |
| prefecture_id      | integer  | null: false              |
| sender_days        | integer  | null: false              |
| price              | integer  | null: false              |
| user_id            | string   | null: false              |
### Association
- belongs_to : user
- has_many : purchases

## purchases テーブル
| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| user_id            | string   | null: false              |
| item_id            | string   | null: false              |
### Association
- belongs_to : user
- belongs_to : item
- has_one : address

## addresses　テーブル
| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| post_code          | string   | null: false              |
| prefectures_id     | string   | null: false              |
| municipalitie      | string   | null: false              |
| address            | string   | null: false              |
| building_name      | string   |                          |
| phone_number       | string   | null: false              |
### Association
- belongs_to : purchase
