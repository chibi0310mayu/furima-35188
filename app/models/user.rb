class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :fist_name, presence: true
  validates :family_name_kana, presence: true
  validates :fist_name_kana, presence: true
  validates :birthdate, presence: true




  
end