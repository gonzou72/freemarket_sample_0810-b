class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2], password_length: 7...128
  validates :nickname, :email,  :last_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day, presence: true
  validates :password, presence: true, on: :sign_up
  validates :nickname, :email, uniqueness: true
  validates :first_name, :last_name, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '全角で入力して下さい。'}
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力して下さい。'}
  
  has_many :items
  has_one :address, inverse_of: :user
  accepts_nested_attributes_for :address
  has_many :buyers

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    
    if snscredential.present? 
      user = User.where(id: snscredential.user_id).first
    else
      user = User.new
    end
    return user
  end
end
