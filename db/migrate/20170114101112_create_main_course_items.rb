class CreateMainCourseItems < ActiveRecord::Migration
  def change
    create_table :main_course_items do |t|
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
