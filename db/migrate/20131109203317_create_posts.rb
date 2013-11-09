class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :rating
      t.integer :difficulty
      t.boolean :isfinished
      t.boolean :ispublic

      t.timestamps
    end
  end
end
