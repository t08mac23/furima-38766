class OrderDelivery < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :address1, :address2, :building, :phone_number, :oreder_id

  with_options presence: true do
    validates :user_id, :item_id, :address1, :address2, :oreder_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validetes :phone_number, format: {:with \A0\d{9,10}\z, message: "is invalid. Input only number"}
  end
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, building: building, phone_number: phone_number, oreder_id: oreder_id)
  end
end
