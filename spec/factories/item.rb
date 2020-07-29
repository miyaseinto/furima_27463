FactoryBot.define do
  factory :user do
    name                  { '商品' }
    explanation           { 'よろしく' }
    detail_category       { 'レディース' }
    detail_status         { '新品・未使用' }
    delivery_burden       { '直払い（購入者負担）' }
    delivery_area         { '北海道' }
    delivery_days         { '１〜２日で発送' }
    selling_price         { '300' }
  end
end
