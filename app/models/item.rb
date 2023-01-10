class Item < ApplicationRecord

  validates :image,                 presence: true
  validates :item_name,             presence: true
  validates :description,           presence: true
  validates :category_id,           numericality: { other_than: 1 , message: "を入力してください" }
  validates :condition_id,          numericality: { other_than: 1 , message: "を入力してください" }
  validates :delivery_charge_id,    numericality: { other_than: 1 , message: "を入力してください" }
  validates :prefecture_id,         numericality: { other_than: 0 , message: "を入力してください" }
  validates :delivery_date_id,      numericality: { other_than: 1 , message: "を入力してください" }
  
  
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "を入力してください" }
  

  # アソシエーション

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_date
end
