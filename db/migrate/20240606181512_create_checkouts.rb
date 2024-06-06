class CreateCheckouts < ActiveRecord::Migration[7.1]
  def change
    create_table :checkouts do |t|
      t.references :cart, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
