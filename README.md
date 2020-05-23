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
|email|string|null:false|
|password|string|null:false|
|paying_way|string|null:false|

Association

- has_many:favorite
- has_many:comment
- has_many:products
- has_many:order_starus
- belongs_to:address

** users_profileテーブル(enumで管理) **

|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|last_name|string|null:false|
|last_name_kana|string|null:false|
|first_name_kana|string|null:false|
|tel_number|string|null:false|
|biryh_y|string|null:false|
|biryh_m|string|null:false|
|biryh_d|string|null:false|

** favoliteテーブル **

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foregin_key:true|
|product|reference|null:false,foregin_key:true|

Association

- belongs_to:users
- belongs_to:products

** commentsテーブル **

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foregin_key:true|
|product_id|reference|null:false,foregin_key:true|
|comment|text|null:false|

Association

- belongs_to:users
- belongs_to:products

** order_statusテーブル **

|Column|Type|Options|
|------|----|-------|
|purchaser_id|integer|null:false,add_index/add_foreign|
|seller_id|integer|null:false,add_index/add_foreign|
|status|integer|null:false|
|item_id|reference|null:false,foregin_key:true|

Association

- belongs_to:users
- belongs_to:products
- has_many:transection_record

** transaction_recordテーブル **
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foregin_key:true|
|order_status|reference|null:false,foregin_key:true|

Association

- belongs_to:order_status


** productsテーブル **

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|category_id|reference|null:false,forgin_key:true|
|condition|string|null:false|
|price|string|null:false|
|shipping_days|string|null:false|
|postage|string|null:false|
|user_id|string|null:false,foregin_key:true|
|explanation|text|null:false|

Association

- belongs_to:user
- has_many:favorite
- has_many:comments
- has_many:order_status
- belongs_to:category
- has_many:images



** addressテーブル **

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foregin_key:true|
|post_number|string|null:false|
|city|string|null:false|
|block|string|null:false|
|address|string|null:false|
|bulding_name|string|null:false|

Asscsiation

- belongs_to:users

** categoryテーブル **

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

Asscsiation

- has_many:products

** imagesテーブル **

|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|product_id|reference|null:false,foregin_key:true|

Association

- belongs_to:products


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


