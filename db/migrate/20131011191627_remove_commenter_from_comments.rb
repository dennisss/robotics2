class RemoveCommenterFromComments < ActiveRecord::Migration
  def up
		remove_column :comments, :commenter
  end

  def down
  end
end
