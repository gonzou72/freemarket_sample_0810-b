class Card < ApplicationRecord
  belongs_to :buyers
  belongs_to :item
end
