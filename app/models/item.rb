class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :shipping
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :burden_id
    validates :area_id
    validates :shipping_id
  end
end
