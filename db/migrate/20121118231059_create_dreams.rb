class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.integer :user_id
      t.string :title
      t.text :teaser
      t.text :body
      t.string :version
      t.text :changelog
      t.string :message
      t.text :freezebody
      t.integer :state
      t.date :submitted
      t.date :accepted

      t.timestamps
    end
  end
end
