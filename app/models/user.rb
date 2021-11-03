class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  ##バリデーションの設定
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Password is invalid. Include both letters and numbers"}
  validates :nickname,         presence: true
  validates :birthday,         presence: true

  with_options presence: true do
    validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Input full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "Input full-width characters"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/, message: "Input full-width katakana characters"}
  end


end
