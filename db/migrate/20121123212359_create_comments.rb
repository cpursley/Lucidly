class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :dream_id
      
      t.string :body, :null => false

      t.timestamps
    end

    add_index :comments, [:user_id, :dream_id]
  end
end
