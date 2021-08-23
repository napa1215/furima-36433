## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | date   | null: false               |
| family_name        | date   | null: false               |
| first_name_kana    | date   | null: false               |
| family_name_kana   | date   | null: false               |
| birthday           | date   | null: false               |

- has_many :purchases
- has_one :item

## itemsテーブル
| Column              | Type        | Options     
| ------------------- | ----------- | ----------- |
| name                | string      | null: false |
| text                | text        | null: false |
| price               | integer     | null: false |
| delivery_fee_id     | integer     | null: false |
| area_id             | integer     | null: false |
| delivery_day_id     | integer     | null: false |
| category_id         | integer     | null: false |
| condition_id        | integer     | null: false |
| order               | references  | foreign_key: true |
| user                | references  | foreign_key: true |

- has_one :purchase

## addressesテーブル
| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| postal_code     | integer    | null: false |
| prefecture_id   | integer    | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building        | string     |             |
| phone           | string     | null: false |

- has_many :items

## purchasesテーブル
| Column | Type       | Options           |
| ------ | -----------| ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

- belongs_to :items