class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.text :email
      t.text :phone
      t.text :person
      t.text :address
      t.references :delivery_option, foreign_key: true
      t.json :cart
      t.integer :status

      t.timestamps
    end
  end
end
