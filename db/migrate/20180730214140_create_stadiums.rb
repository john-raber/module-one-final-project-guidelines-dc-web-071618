class CreateStadiums < ActiveRecord::Migration[5.0]
  def change
    create_table :stadiums do |t|
      t.string :name 
      t.integer :team_id
    end
  end
end
