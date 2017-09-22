class CreateAdoptions < ActiveRecord::Migration[5.1]
  def change
    create_table :adoptions do |t|
      t.integer :course_id
      t.integer :textbook_id

      t.timestamps
    end
  end
end
