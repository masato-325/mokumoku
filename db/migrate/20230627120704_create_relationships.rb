class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id # フォローする人
      t.integer :followed_id # フォローされる人
      t.timestamps
    end
    add_index :relationships, :follower_id
    add_index :relationships, :followed_id
    # 重複を許さない
    add_index :relationships, [:follower_id, :followed_id], unique: true
  end
end
