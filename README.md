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
| Column                  | Type       | Options                  |
| ----------------------- | ---------- | ------------------------ |
| item_name               | string     | null: false              |
| explanation             | text       | null: false              |
| genre_id                | integer    | null: false              |
| commodity_condition_id  | integer    | null: false              |
| shipping_charge_id      | integer    | null: false              |
| prefecture_id           | integer    | null: false              |
| days_to_ship_id         | integer    | null: false              |
| selling_price           | integer    | null: false              |
| user                    | references | null: false              |
### Association
- belongs_to : user
- has_one : purchase

## purchases テーブル
| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| user               | references | null: false              |
| item               | references | null: false              |

### Association
- belongs_to : user
- belongs_to : item
- has_one : address

## addresses　テーブル
| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| post_code          | string     | null: false              |
| prefectures_id     | integer    | null: false              |
| municipalitie      | string     | null: false              |
| address            | string     | null: false              |
| building_name      | string     |                          |
| phone_number       | string     | null: false              |
| purchase           | references | null: false              |
### Association
- belongs_to : purchase
