class CreateAdmPoliticians < ActiveRecord::Migration
  def change
    create_table :adm_politicians do |t|
      t.string :name
      t.integer :number
      t.string :party
      t.string :email

      t.timestamps null: false
    end
  end
end
