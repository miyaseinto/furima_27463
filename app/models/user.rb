class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  # has_many :purchases

  with_options presence: true do |assoc|
    assoc.validates :family_name
    assoc.validates :last_name
    assoc.validates :nickname
    assoc.validates :family_furigana
    assoc.validates :last_furigana
    assoc.validates :birthday
  end
end
