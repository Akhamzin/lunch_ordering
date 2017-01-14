class AddMenuIdToDrinkItem < ActiveRecord::Migration
  def change
    add_reference :drink_items, :menu, index: true, foreign_key: true
  end
end
