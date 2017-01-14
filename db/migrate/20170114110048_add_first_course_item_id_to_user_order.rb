class AddFirstCourseItemIdToUserOrder < ActiveRecord::Migration
  def change
    add_reference :user_orders, :first_course_item, index: true, foreign_key: true
  end
end
