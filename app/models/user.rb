class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  ##バリデーションの設定
  validates :nickname,         precense: true
  validates :last_name,        precense: true
  validates :first_name,       precense: true
  validates :last_name_kana,   precense: true
  validates :first_name_kana,  precense: true
  validates :birthday,         precense: true


end
