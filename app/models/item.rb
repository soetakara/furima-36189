class Item < ApplicationRecord
  ## バリデーションの設定
  validates :title,            presence: true
  validates :category_id,      presence: true
  validates :status_id,        presence: true
  validates :fee_id,           presence: true
  validates :prefecture_id,    presence: true
  validates :shipping_date_id, presence: true
  validates :price,            presence: true
  validates :explantion,       presence: true

  ##アソシエーションの設定
  belongs_to :user
  
end
