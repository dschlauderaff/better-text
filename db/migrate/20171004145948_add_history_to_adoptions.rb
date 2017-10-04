class AddHistoryToAdoptions < ActiveRecord::Migration[5.1]
  def change
    add_column :adoptions, :history, :integer, default: 0 
  end
end
