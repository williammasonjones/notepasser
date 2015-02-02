class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :title
      t.string :body
      t.integer :message_id
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps null: true
    end
  end

  def self.down
    drop_table :messages
  end
end
