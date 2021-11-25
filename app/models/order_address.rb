class OrderAddress
  inculde ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number, :user_id, :item_id, :token

  ##addressのバリデーション
  validates :postal_code,      presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,    numericality: {other_than: 1, message: "can't be blank"}
  validates :municipality,     presence: true
  validates :house_number,     presence: true
  validate  :building_name
  validates :telephone_number, presence: true, format: {with: /\A[0-9]+\z/, greater_than_or_equal_to: 10, less_than_or_equal_to: 11}

  ##orderのバリデーション
  validates :token,   presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

end