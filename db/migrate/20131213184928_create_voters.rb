class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :username
      t.integer :user_id

      t.timestamps
    end
  end
end
