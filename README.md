# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| password_confirm | string | null: false |
| name             | string | null: false |
| name_katakana    | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_many :purchase_user

## items テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| image           | string | null: false |
| item_name       | string | null: false |
| item_info       | text   | null: false |
| category        | string | null: false |
| item_status     | string | null: false |
| fee_status      | string | null: false |
| item_prefecture | string | null: false |
| day             | string | null: false |
| price           | string | null: false |

### Association

- has_many :purchase_user
- belongs_to :users



## purchase_user テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| users   | references | foreign_key: true |
| items   | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## address テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| card_number    | integer | null: false |
| card_exp_month | integer | null: false |
| card_exp_year  | integer | null: false |
| card_cvc       | integer | null: false |
| postal_code    | integer | null: false |
| prefecture     | string  | null: false |
| city           | string  | null: false |
| address        | string  | null: false |
| building       | string  |             |
| phone_number   | integer | null: false |

### Association

- belongs_to :purchase_user
