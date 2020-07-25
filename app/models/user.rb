class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :last_name, presence: true
  validates :nickname, presence: true
  validates :family_furigana, presence: true
  validates :last_furigana, presence: true
  validates :birthday, presence: true
  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/
  # validates :password, format: { with: VALID_PASSWORD_REGEX }
end
