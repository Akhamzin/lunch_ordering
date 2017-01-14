class AddMainCourseItemIdToUserOrder < ActiveRecord::Migration
  def change
    add_reference :user_orders, :main_course_item, index: true, foreign_key: true
  end
end
