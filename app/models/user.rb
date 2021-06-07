class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
    # ひらがな、カタカナ、漢字のみ許可する
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' } do
      validates :last_name
      validates :first_name
    end

    # カタカナのみ許可する
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :last_name_katakana
      validates :first_name_katakana
    end
  end
  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: 'Password is invalid. Include both letters and numbers' }
end
