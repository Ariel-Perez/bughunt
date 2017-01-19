class CreateBugs < ActiveRecord::Migration[5.0]
  def change
    create_table :bugs do |t|
      t.string :name, null: false
      t.text :description
      t.integer :priority, default: 0
      t.boolean :resolved, default: false

      t.timestamps
    end
  end
end
