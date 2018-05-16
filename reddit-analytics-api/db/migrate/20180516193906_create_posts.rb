class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :karma
      t.string :subreddit
      t.time :timestamp

      t.timestamps
    end
  end
end
