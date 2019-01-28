class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :post_id
      t.boolean :upvote

      t.timestamps
    end
  end
end
