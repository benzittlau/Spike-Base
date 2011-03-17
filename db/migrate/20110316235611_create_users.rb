class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :phone_number

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
