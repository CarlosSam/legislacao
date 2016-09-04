class CreatePoliticiansProjects < ActiveRecord::Migration
  def change 
    create_table :politicians_projects, id: false do |t|
      t.belongs_to :politician, index: true
      t.belongs_to :project, index: true
    end
  end
end
