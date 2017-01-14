class CreateDrinkItems < ActiveRecord::Migration
  def change
    create_table :drink_items do |t|
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
