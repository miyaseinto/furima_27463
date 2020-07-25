FactoryBot.define do
  factory :user do
    nickname              { 'tanaka' }
    family_name           { '田中' }
    last_name             { '隆' }
    family_furigana       { 'タナカ' }
    last_furigana         { 'タカシ' }
    birthday              { '1=>2000,2=>4,3=>1' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { '00000000' }
  end
end
