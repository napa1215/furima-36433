## usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| first_name         | string | null: false |
| family_name        | string | null: false |
| first_name_kana    | string | null: false |
| family_name_kana   | string | null: false |

## commentsテーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| comment_text | text       | null: false |
| user.id      | references |             |
| item_id      | references |             |

## itemsテーブル
| Column           | Type        | Options     |
| ---------------- | ----------- | ----------- |
| image            | string      | null: false |
| item_name        | string      | null: false |
| item_text        | text        | null: false |
| price            | string      | null: false |
| category         | string      | null: false |
| condition        | string      | null: false |
| shipping_address | string      | null: false |
| delivery_days    | string      | null: false |
| user_id          | references  |             |
| comment_id       | references  |             |

## addressesテーブル
| Column          | Type       | Options     |
| --------------- | -----------| ----------- |
| postal_code     | string     | null: false |
| city            | string     | null: false |
| street          | string     | null: false |
| address         | string     | null: false |
| building        | string     | null: false |
| phone           | string     | null: false |
| user_id         | references |             |
| item_id         | references |             |
