class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7...128
  validates :nickname, :email, :password, :last_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day, presence: true, on: :create
  validates :nickname, uniqueness: true, presence: true, on: :account_update
  validates :nickname, :email, uniqueness: true, on: :create
  validates :first_name, :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'を全角で入力して下さい。'}, on: :create
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カタカナで入力して下さい。'}, on: :create
end
