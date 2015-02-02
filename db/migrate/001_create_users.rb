class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :user_name
      t.timestamps null: true
    end
  end

  def self.down
    drop_table :users
  end
end
