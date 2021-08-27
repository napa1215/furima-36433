## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

- has_many :purchases
- has_many :items

## itemsテーブル
| Column              | Type        | Options     
| ------------------- | ----------- | ----------- |
| name                | string      | null: false |
| text                | text        | null: false |
| price               | integer     | null: false |
| delivery_fee_id     | integer     | null: false |
| area_id             | integer     | null: false |
| user                | references  | foreign_key: true |

- has_one :purchase
- belongs_to :user

## addressesテーブル
| Column          | Type       | Options          |
| --------------- | -----------| ----------- |
| postal_code     | integer    | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building        | string     |                 |
| phone           | string     | null: false       |
| purchases       | references | foreign_key: true |

- belongs_to :purchase

## purchasesテーブル
| Column | Type       | Options           |
| ------ | -----------| ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

- belongs_to :item
- belongs_to :user
- belongs_to :address