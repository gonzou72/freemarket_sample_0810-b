class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7...128
  validates :nickname, :email, :password, :last_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day, presence: true
  validates :nickname, :email, uniqueness: true
  validates :first_name_kana, :last_name_kana, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナで入力して下さい。'}
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力して下さい。'}
end
