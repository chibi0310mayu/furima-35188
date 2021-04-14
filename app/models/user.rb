class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }, presence: true
  validates :fist_name, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ }, presence: true
  validates :family_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }, presence: true
  validates :fist_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }, presence: true
  validates :birthdate, presence: true
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX },
                       presence: true
end
