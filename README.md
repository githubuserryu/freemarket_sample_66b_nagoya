# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false index: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|profile_img|string| |
|profile_text|text| |
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- has_many :items
- has_many :trades
- has_many :comments
- has_many :likes
- has_many :addresses
- has_many :cards
- has_many :active_relationships, class_name: “Relationship”, foreign_key: “follower_id”
- has_many :passive_relationships, class_name: “Relationship”, foreign_key: “followed_id”
## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|size|integer|null: false|
|price|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|status|integer|null: false|
|charge|integer|null: false|
|trade_step|integer|null: false,index: true|
|delivery|integer|null: false|
|prefecture|integer|null: false, index: true|
|term|integer|null: false|
|item_text|text|null: false |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :likes
- has_many :comments
- has_many :item_imgs
- has_one :trade
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|post_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string| |
|master|boolean|null: false, default, true|
### Association
- belongs_to :user
## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null: false|
|item_id|integer|foreign_key: true, null: false|
### Association
- belongs_to :user
- belongs_to :item
## item_imgsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|img|string|null: false|
### Association
- belongs_to :item
## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|integer|null: false foreign_key: true|
|item_id|integer|null: false foreign_key: true|
|status|integer|null: false|
|rating|integer|null: false|
### Association
- belongs_to :user
- belongs_to :item
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|parent_id|integer|forelign_key: true|
### Association
- has_many :items
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false index: true|
### Association
- has_many :items
## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|belongs_to :follower, class_name: “User”|
|followed_id|integer|belongs_to :followed, class_name: “User”|
### Association
- belongs_to :follower, class_name: “User”
- belongs_to :followed, class_name: “User”

## SNS_credentialテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user|references|foreign_key: true|

###
- belongs_to :user