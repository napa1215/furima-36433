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

- has_many :orders
- has_many :items

## itemsテーブル
| Column              | Type        | Options           |
| ------------------- | ----------- | ----------------- |
| title               | string      | null: false       |
| text                | text        | null: false       |
| genre_id            | integer     | null: false       |
| condition_id        | integer     | null: false       |
| delivery_fee_id     | integer     | null: false       |
| prefecture_id       | integer     | null: false       |
| delivery_time_id    | integer     | null: false       |
| price               | integer     | null: false       |
| user                | references  | foreign_key: true |

- has_one :order
- belongs_to :user

## addressesテーブル
| Column          | Type       | Options           |
| --------------- | -----------| ----------------- |
| postal_code     | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| address         | string     | null: false       |
| building        | string     |                   |
| phone           | string     | null: false       |
| order           | references | foreign_key: true |

- belongs_to :order

## ordersテーブル
| Column | Type       | Options           |
| ------ | -----------| ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

- belongs_to :item
- belongs_to :user
- belongs_to :address