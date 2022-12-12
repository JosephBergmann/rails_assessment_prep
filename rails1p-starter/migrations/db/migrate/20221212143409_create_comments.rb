class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      
      t.references :video, null: false, foreign_key: true
      t.references :commenter, null: false, foreign_key: {to_table: :users}
      t.references :parent_comment, null: false, foreign_key: {to_table: :comments}
      t.timestamps
    end
  end
end
