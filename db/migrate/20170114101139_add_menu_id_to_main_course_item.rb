class AddMenuIdToMainCourseItem < ActiveRecord::Migration
  def change
    add_reference :main_course_items, :menu, index: true, foreign_key: true
  end
end
