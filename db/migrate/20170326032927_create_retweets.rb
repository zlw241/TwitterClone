class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :user_id, null: false
      t.integer :tweet_id, null: false

      t.timestamps null: false
    end

    add_index :retweets, :user_id
    add_index :retweets, :tweet_id 
  end
end
