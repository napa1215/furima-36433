class Listing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :Prefecture
  belongs_to :delivery_time

  #空の投稿を保存できないようにする 
  validates :image, :item, :text, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :condition_id, :delivery_fee, :Prefecture, :delivery_time, numericality: { other_than: 1 , message: "can't be blank"} 
end
