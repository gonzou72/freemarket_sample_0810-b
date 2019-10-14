class SnsCredential < ApplicationRecord
  belongs_to :user
  validates :provider, :uid, presence: true
  validates_uniqueness_of :uid, :scope => :provider 
end
