class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  #空の投稿を保存できないようにする 
  validates :image, :title, :price, :text, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 0 , message: "can't be blank"} 
  #全角数字だと保存できないようにする
  validates :price, format: {with: /\A[0-9]+\z/, message: "Price is invalid. Input full-width characters"} do
  end
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

end
