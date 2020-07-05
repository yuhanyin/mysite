class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.integer :role, default: 0 # user ->0 admin -> 1
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean
    add_column :users, :activated_at, :datetime
    add_column :users, :reset_digest, :string
    add_column :users, :reset_sent_at, :datetime

    create_table :products do |t|
      t.integer :del, default: 0 # if set 1, hide
      t.string :name
      t.integer :price
      t.string :body
      t.string :mileage
      t.string :engV
      t.string :engType
      t.string :registration
      t.integer :year
      t.string :model
      t.string :drive
      t.timestamps
    end

    create_table :orders do |t|
      t.integer :state
      t.belongs_to :user
      t.belongs_to :product
      t.timestamps
      # t.index [:user_id, :created_at]
    end
  end
end
