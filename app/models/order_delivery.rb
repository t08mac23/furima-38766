class OrderDelivery 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :address1, :address2, :building, :phone_number, :order_id, :token
  with_options presence: true do
    validates :user_id, :address1, :address2, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Input only number"}
  end
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, address1: address1, address2: address2, building: building, phone_number: phone_number, order_id: order.id)
  end
end