class Address < ApplicationRecord
  validates :postal_code,      presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,    numericality: {other_than: 1, message: "can't be blank"}
  validates :municipality,     presence: true
  validates :house_number,     presence: true
  validate  :building_name
  validates :telephone_number, presence: true, format: {with: /\A[0-9]+\z/, greater_than_or_equal_to: 10, less_than_or_equal_to: 11}

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
