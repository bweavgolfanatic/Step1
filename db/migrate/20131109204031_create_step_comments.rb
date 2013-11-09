class CreateStepComments < ActiveRecord::Migration
  def change
    create_table :step_comments do |t|
      t.string :text
      t.integer :rating
      t.integer :user_id
      t.integer :step_id

      t.timestamps
    end
  end
end
