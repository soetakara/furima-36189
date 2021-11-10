class Item < ApplicationRecord
  ## バリデーションの設定
  validates :title,            presence: true
  validates :category_id,      numericality: {other_than: 1, message: " can't be blank"}
  validates :status_id,        numericality: {other_than: 1, message: " can't be blank"}
  validates :fee_id,           numericality: {other_than: 1, message: " can't be blank"}
  validates :prefecture_id,    numericality: {other_than: 1, message: " can't be blank"}
  validates :shipping_date_id, numericality: {other_than: 1, message: " can't be blank"}
  # validates :price,            presence: true
  validates :explantion,       presence: true

  validates :image,            presence: true

  with_options presence: true do
    validates :price,          numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Price is out of setting range"}
    validates :price,          format: {with: /\A[0-9]+\z/, message: " is invalid. Input half-width characters"}
  end

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
