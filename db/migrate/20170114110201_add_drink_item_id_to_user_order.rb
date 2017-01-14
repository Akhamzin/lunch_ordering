class AddDrinkItemIdToUserOrder < ActiveRecord::Migration
  def change
    add_reference :user_orders, :drink_item, index: true, foreign_key: true
  end
end
