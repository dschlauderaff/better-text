class CreateTextbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :textbooks do |t|
      t.string :title
      t.integer :inventory
      t.integer :price

      t.timestamps
    end
  end
end
