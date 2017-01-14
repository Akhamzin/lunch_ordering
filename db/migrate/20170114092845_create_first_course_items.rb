class CreateFirstCourseItems < ActiveRecord::Migration
  def change
    create_table :first_course_items do |t|
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
