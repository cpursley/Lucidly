class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.text :teaser, :null => false
      t.text :body, :null => false
      t.string :version
      t.text :changelog
      t.string :message
      t.text :freezebody
      t.integer :state, :null => false, :default => 0   # 0 = private dream, 1 = public dream
      t.date :submitted
      t.date :accepted

      t.timestamps
    end
  end
end
