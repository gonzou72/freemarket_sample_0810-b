class AddItemIdToStatuses < ActiveRecord::Migration[5.0]
  def change
    add_reference :statuses, :item, foreign_key: true
  end
end
