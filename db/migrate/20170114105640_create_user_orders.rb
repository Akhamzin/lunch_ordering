class CreateUserOrders < ActiveRecord::Migration
  def change
    create_table :user_orders do |t|
      t.datetime :date
      t.string :order_owner

      t.timestamps null: false
    end
  end
end
