class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number, :user_id, :item_id, :token

  ##addressのバリデーション
  validates :postal_code,      presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,    numericality: {other_than: 1, message: "can't be blank"}
  validates :municipality,     presence: true
  validates :house_number,     presence: true
  validate  :building_name
  validates :telephone_number, presence: true, format: {with: /\A[0-9]+\z/, message: " is invalid. Input only number"}, length: { minimum: 10, maximum: 11 }

  ##orderのバリデーション
  validates :token,   presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, telephone_number: telephone_number, order_id: order.id)
  end
end