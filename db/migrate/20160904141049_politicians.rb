class Politicians < ActiveRecord::Migration
  def change
  	drop_table :adm_politicians
  	create_table :politicians do |t|
      t.string :name
      t.integer :number
      t.string :party
      t.string :email
      t.timestamps null: false
    end
  end
end
