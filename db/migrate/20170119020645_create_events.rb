class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.references :bug, foreign_key: true
      t.integer :score
      t.integer :type

      t.timestamps
    end
  end
end
