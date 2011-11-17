class CreateTwitterLists < ActiveRecord::Migration
  def self.up
    create_table :twitter_lists do |t|
      t.string :name
      t.string :owner
      t.string :slug
      t.timestamps
    end
  end

  def self.down
    drop_table :twitter_lists
  end
end
