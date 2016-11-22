class AddIndexToStep < ActiveRecord::Migration[5.0]
  def change
  	add_index :steps, :recipe_id
  end
end
