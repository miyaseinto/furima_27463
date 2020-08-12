class PurchaseAddresse
  include ActiveModel::Model
  attr_accessor :postal, :prefectures, :area, :address, :building, :phone, :item_id, :user_id

  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :phone, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end
  validates :prefectures, numericality: { other_than: 0, message: "can't be blank" }
  validates :area, presence: true
  validates :address, presence: true
  validates :phone, length: { maximum: 11, message: 'is out of setting range' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Addresse.create(user_id: user_id, postal: postal, prefectures: prefectures, area: area, address: address, building: building, phone: phone, item_id: item_id)
  end
end
