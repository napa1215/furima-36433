class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."} do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :first_name
    validates :family_name
  end
    # カタカナのみ許可する
  with_options presence: true,format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
    validates :first_name_kana 
    validates :family_name_kana
  end

    # 半角英字数字のみ許可する
    validates :password, format: {with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}\z/ , message: "is invalid. Input half-width characters."} do
    end

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :birthday
  end
    has_many :items
end
