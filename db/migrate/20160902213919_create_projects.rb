class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :recipient
      t.text :wants
      t.text :doing
      t.text :impacts
      t.text :strategy
      t.text :explore
      t.text :define
      t.text :causes
      t.text :prototype

      t.timestamps null: false
    end
  end
end
