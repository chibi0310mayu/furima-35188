# README

## usersテーブル
(devise)使用

| column            | Type     | Options               |
|-------------------|----------|-----------------------|
| email             | string   | NOT NULL  unique: true|
|-------------------|----------|-----------------------|
| encrypted_password| string   | NOT NULL              |
|-------------------|----------|-----------------------|
| nickname          | string   | NOT NULL              |
|-------------------|----------|-----------------------|
| family_name       | string   | NOT NULL              |
|-------------------|----------|-----------------------|
| fist_name         | string   | NOT NULL              |
|-------------------|----------|-----------------------|
| family_name_kana  | string   | NOT NULL              |
|-------------------|----------|-----------------------|
| fist_name_kana    | string   | NOT NULL              |
|-------------------|----------|-----------------------|
| birthdate         | date     | NOT NULL              |
|-------------------|----------|-----------------------|

### Association
- has_many :items
- has_many :purchase




## addressesテーブル

| column          | Type      | Options                     |
|-----------------|-----------|-----------------------------|
| post_code       | string(7) | NOT NULL                    |
|-----------------|-----------|-----------------------------|
| prefecture_id   | integer   | NOT NULL                    |
|-----------------|-----------|-----------------------------|
| city            | string    | NOT NULL                    |
|-----------------|-----------|-----------------------------|
| home_num        | string    | NOT NULL                    |
|-----------------|-----------|-----------------------------|
| building_name   | string    |                             |
|-----------------|-----------|-----------------------------|
| tel             | string    | NOT NULL                    |
|-----------------|-----------|-----------------------------|
| purchase        | references| foreign_key: true NOT NULL  |
|-----------------|-----------|-----------------------------|
|-----------------|-----------|-----------------------------|

### Association
- belongs_to : purchase 

## prefecture
(active_hash)使用



## itemsテーブル

| column          | Type     | Options         |
|-----------------|----------|-----------------|
| name            | string   | NOT NULL        |
|-----------------|----------|-----------------|
| explanation     | text     | NOT NULL        |
|-----------------|----------|-----------------|
| category_id     | integer  | NOT NULL        |
|-----------------|----------|----------------------------|
| condition_id    | integer  | NOT NULL                   |
|-----------------|----------|----------------------------|
| burden_id       | integer  | NOT NULL                   |
|-----------------|----------|----------------------------|
| area_id         | integer  | NOT NULL                   |
|-----------------|----------|----------------------------|
| shipping_id     | integer  | NOT NULL                   |
|-----------------|----------|----------------------------|
| price           | integer  | NOT NULL                   |
|-----------------|----------|----------------------------|
| user            |references|foreign_key: true NOT NULL  |
|-----------------|----------|----------------------------|
|-----------------|----------|----------------------------|
### Association
- belongs_to : user
- belongs_to : category
- belongs_to : condition
- belongs_to : burden
- belongs_to : area
- belongs_to : shipping
- has_one_attached : image
- has_one : purchase
## category
## condition
## burden
## area
## shipping
(active_hash)使用


## imageテーブル
(ActiveStorage)を使用



## purchasesテーブル

| column          | Type     | Options                   |
|-----------------|----------|---------------------------|
| item            |references| foreign_key: true NOT NULL|
|-----------------|----------|---------------------------|
| user            |references| foreign_key: true NOT NULL|
|-----------------|----------|---------------------------|

### Association
- has_one : address
- belongs_to : user
- belongs_to : item