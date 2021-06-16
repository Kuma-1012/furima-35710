class PurchaseUserAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :building, :address, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase_user = PurchaseUser.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building,
                   address: address, phone_number: phone_number, purchase_user_id: purchase_user.id)
  end
end
