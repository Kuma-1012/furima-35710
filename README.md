# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| last_name_katakana  | string | null: false               |
| first_name_katakana | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_users

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item_name          | string  | null: false |
| item_info          | text    | null: false |
| category_id        | integer | null: false |
| item_status_id     | integer | null: false |
| fee_status_id      | integer | null: false |
| prefecture_id | integer | null: false |
| day_id             | integer | null: false |
| price              | integer | null: false |

### Association

- has_one :purchase_user
- belongs_to :user



## purchase_users テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :addresses

## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| purchase_user | references | foreign_key: true |

### Association

- belongs_to :purchase_user
