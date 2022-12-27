class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

         validates :nickname,           presence: true
         validates :password,           format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
         validates :family_name,        presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
         validates :family_name_kana,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday,           presence: true

        has_many :items
        # has_many :orders

end
