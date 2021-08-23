## usersテーブル
| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| first_name         | string | null: false  |
| family_name        | string | null: false  |
| first_name_kana    | string | null: false  |
| family_name_kana   | string | null: false  |
| birthday           | string | null: false  |

## itemsテーブル
| Column              | Type        | Options     
| ------------------- | ----------- | ----------- |
| name                | string      | null: false |
| text                | text        | null: false |
| price               | integer     | null: false |
| category_id         | integer     | null: false |
| condition_id        | integer     | null: false |

## addressesテーブル
| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| postal_code     | integer    |             |
| prefecture_id   | integer    | null: false |
| city            | integer    |             |
| street          | string     |             |
| address         | string     |             |
| building        | string     |             |
| phone           | string     |             |

## purchasesテーブル
| Column | Type       | Options           |
| ------ | -----------| ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |
