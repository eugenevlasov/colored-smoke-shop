class CreateReserves < ActiveRecord::Migration[5.0]
  def change
    create_table :reserves do |t|
      t.references :order, foreign_key: true
      t.references :good, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
