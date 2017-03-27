class CreateDeliveryOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_options do |t|
      t.text :description
      t.integer :cost
      t.boolean :status

      t.timestamps
    end
  end
end
