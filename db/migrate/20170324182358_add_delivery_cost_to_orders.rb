class AddDeliveryCostToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :delivery_cost, :integer
  end
end
