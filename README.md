# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| nickname        | string     | null: false                    |
| email           | string     | null: false                    |
| password        | integer    | null: false                    |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| birth_date      | integer    | null: false                    | 


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| image          | text       | null: false                    |
| name           | string     | null: false                    |
| content        | text       | null: false                    |
| price          | integer    | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| delivery_fee   | string     | null: false                    |
| delivery_when  | string     | null: false                    |
| delivery_where | string     | null: false                    |
| user           | references | null: false, foreign_key: true |


## comments テーブル

| Column | Type        | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


## orders テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| credit_number     | integer    | null: false                    |
| credit_expiration | integer    | null:false                     |
| security_code     | integer    | null: false                    |
| post_number       | integer    | null: false                    |
| prefecture        | string     | null: false                    |
| city_name         | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |
