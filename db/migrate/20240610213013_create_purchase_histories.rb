class CreatePurchaseHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_histories do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
