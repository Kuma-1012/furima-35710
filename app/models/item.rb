class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :fee_status
  belongs_to :item_prefecture
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :fee_status_id
      validates :item_prefecture_id
      validates :day_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  end
end
