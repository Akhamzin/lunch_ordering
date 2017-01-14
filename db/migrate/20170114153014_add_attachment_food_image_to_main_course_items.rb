class AddAttachmentFoodImageToMainCourseItems < ActiveRecord::Migration
  def self.up
    change_table :main_course_items do |t|
      t.attachment :food_image
    end
  end

  def self.down
    remove_attachment :main_course_items, :food_image
  end
end
