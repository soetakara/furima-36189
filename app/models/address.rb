class Address < ApplicationRecord
  validates :postal_code,      presence: true
  validates :prefecture_id,    numericality: {other_than: 1, message: "can't be blank"}
  validates :municipality,     presence: true
  validates :house_number,     presence: true
  validate  :building_name
  validates :telephone_number, presence: true

  # with 

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
