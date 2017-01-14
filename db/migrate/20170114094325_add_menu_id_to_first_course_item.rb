class AddMenuIdToFirstCourseItem < ActiveRecord::Migration
  def change
    add_reference :first_course_items, :menu, index: true, foreign_key: true
  end
end
