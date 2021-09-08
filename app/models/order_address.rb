class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone, :order, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}  
    validates :user_id
  end 
    validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}

  def save
    Order.create(item_id, user_id)
    Address.create(postal_code, prefecture_id, city, address, building, phone, order)
  end
end