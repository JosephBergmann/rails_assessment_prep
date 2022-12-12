class ChangeComments < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:comments, :parent_comment_id, null: true)
  end
end
