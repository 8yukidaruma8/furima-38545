class PurchasesAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :municipalitie, :address, :building_name, :phone_number, :purchase, :user_id, :item_id , :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid.Input only number"}
    validates :municipalitie
    validates :user_id
    validates :item_id
    validates :token
    validates :address
  end
  validates :prefectures_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, municipalitie: municipalitie, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end

