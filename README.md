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

## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|name|string|null: false|
|password|string|null: false, unique: true|
|email|string|null: false, unique: true|
|birthday|integer|null: false|


### Association
- has_many :products
- belongs_to :purchase

## productテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|explanation|text|null: false|
|detail-category|string|null: false|
|detail-status|string|null: false|
|delivery-burden|string|null: false|
|delivery-area|string|null: false|
|delivery-days|string|null: false|
|selling-price|integer|null: false|

### Association
- belongs_to :user
- belongs_to :purchase

## purchaseテーブル

|Column|Type|Options|
|------|----|-------|
|credit|integer|null: false|
|expiration|integer|null: false|
|security|integer|null: false|
|postal|integer|null: false|
|prefectures|string|null: false|
|area|string|null: false|
|address|string|null: false|
|building|string||
|phone|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product