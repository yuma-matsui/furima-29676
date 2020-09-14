class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_number, :prefecture_id, :city_name, :house_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city_name
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city_name: city_name, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
