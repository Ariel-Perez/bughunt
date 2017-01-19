class CreateJoinTableBugsTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :bugs, :tags do |t|
      t.index [:bug_id, :tag_id]
      t.index :bug_id
    end
  end
end
