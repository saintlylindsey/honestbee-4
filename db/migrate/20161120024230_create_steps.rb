class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.integer :number
      t.text :description

      t.timestamps
    end
  end
end
