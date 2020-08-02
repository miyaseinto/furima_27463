class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  has_one :address

  validates :selling_price, numericality:{ only_integer:true, greater_than:300, less_than:9999999}
  with_options presence: true do |assoc|
    assoc.validates :image
    assoc.validates :name
    assoc.validates :explanation
    assoc.validates :detail_category
    assoc.validates :detail_status
    assoc.validates :delivery_burden
    assoc.validates :delivery_area
    assoc.validates :delivery_days
    assoc.validates :selling_price
  end
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
