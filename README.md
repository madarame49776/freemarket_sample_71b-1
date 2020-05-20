# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization
** userテーブル **

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|tel_number|string|null:false|
|nickname|string|null:false|
|password|string|null:false,unique:true|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|string|null:fals|

Association

- has_many:product
- has_many:comment
- has_many:favorite
- belongs_to:address
- belongs_to:cards


** addressテーブル **

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foregin_key:true|
|post_number|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|address|string|null:false|
|apartment|string|null:false|

Asscsiation

- belongs_to:users


** productテーブル **

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|user_id|reference|null:false,foregin_key:true|
|category_id|reference|null:false,forgin_key:true|
|brand|----|-------|
|condition|string|null:false|
|postage|string|null:false|
|size|reference|null:false,foregin_key:true|
|explanation|text|null:false|

Association

- belongs_to:user
- belongs_to:category
- belongs_to:size
- has_many:images
- has_many:comment
- has_many:favorite


** imagesテーブル **

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|product_id|reference|null:false,foregin_key:true|

Association

- belongs_to:product


** cardテーブル **

|Column|Type|Options|
|------|----|-------|
|user|reference|null:false,foregin_key:true|
|customer|string|null:false|
|card_id|string|null:false|

Association

- belongs_to:user


** categoryテーブル **

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

- has_many:product


** commentテーブル **

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foregin_key:true|
|product_id|reference|null:false,foregin_key:true|
|comment|text|null:false|

Association

- belongs_to:user
- belongs_to:product


** favoliteテーブル **

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foregin_key:true|
|product|reference|null:false,foregin_key:true|

Association

- belongs_to:user
- belongs_to:product


** sizeテーブル **

|Column|Type|Options|
|------|----|-------|
|size|string|null:false|

Association

- has_many:product

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
