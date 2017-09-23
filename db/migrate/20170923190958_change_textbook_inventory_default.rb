class ChangeTextbookInventoryDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:textbooks, :inventory, 0)
  end
end
