class Status < ApplicationRecord
  has_many :status_comments
  belongs_to :item
  has_one :rating
end
