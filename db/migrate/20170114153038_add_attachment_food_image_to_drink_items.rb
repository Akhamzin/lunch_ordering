class AddAttachmentFoodImageToDrinkItems < ActiveRecord::Migration
  def self.up
    change_table :drink_items do |t|
      t.attachment :food_image
    end
  end

  def self.down
    remove_attachment :drink_items, :food_image
  end
end
