class Item < ApplicationRecord
  ## バリデーションの設定
  validates :title,            presence: true
  validates :category_id,      numericality: {other_than: 1}
  validates :status_id,        numericality: {other_than: 1}
  validates :fee_id,           numericality: {other_than: 1}
  validates :prefecture_id,    numericality: {other_than: 1}
  validates :shipping_date_id, numericality: {other_than: 1}
  validates :price,            presence: true
  validates :explantion,       presence: true

  validates :image,            presence: true

  ##アソシエーションの設定
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :shipping_date
  
end
