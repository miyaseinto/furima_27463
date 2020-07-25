class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do |assoc|
    assoc.validates :family_name
    assoc.validates :last_name
    assoc.validates :nickname
    assoc.validates :family_furigana
    assoc.validates :last_furigana
    assoc.validates :birthday
  end
  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/
  # validates :password, format: { with: VALID_PASSWORD_REGEX }
end
