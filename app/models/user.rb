class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :family_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
  validates :fist_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }
  validates :family_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :fist_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birthdate
  end 
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
                      
end
