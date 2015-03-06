class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :user_id
      t.integer :image_id
      t.text :title
      t.text :description

      t.timestamps null: false
    end
  end
end
