class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  has_one :purchase
  belongs_to :genre
  belongs_to :commodity_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user

  with_options presence: true do
    validates :item_name, length:{ maximum: 40 }
    validates :explanation, length:{ maximum: 1000 }
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 , message: "can't be blank"} do
    validates :genre_id
    validates :commodity_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  validates :selling_price,
          numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: ' is out of setting range' }, allow_blank: true
  validates :selling_price, presence: true
end
