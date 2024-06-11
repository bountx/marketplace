class AddPurchaseHistoryToCarts < ActiveRecord::Migration[7.1]
  def change
    add_reference :carts, :purchase_history, foreign_key: true
  end
end
