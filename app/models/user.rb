class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/ } do
      validates :family_name
      validates :fist_name
    end
    with_options format: { with: /\A([ァ-ン]|ー)+\z/ } do
      validates :family_name_kana
      validates :fist_name_kana
    end
    validates :birthdate
  end
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
