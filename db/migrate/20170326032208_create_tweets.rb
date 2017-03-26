class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.integer :reply_id
      t.timestamps null: false
    end

    add_index :tweets, :reply_id
  end
end
