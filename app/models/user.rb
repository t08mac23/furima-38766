class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/.freeze

         validates :nickname,           presence: true
         validates :encrypted_password, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
         validates :family_name,        presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
         validates :family_name_kana,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday,           presence: true

        has_many :items
        has_many :orders

end
