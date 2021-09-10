class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one    :order
  #空の投稿を保存できないようにする 
  validates :image, :title, :text, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_time_id, numericality: { other_than: 0 , message: "can't be blank"}
  #「価格」が整数のみかつ300 ~ 9,999,999円の範囲であること。  
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: {with: /\A[0-9]+\z/}
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time

end
