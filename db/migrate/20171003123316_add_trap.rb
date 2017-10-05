class AddTrap < ActiveRecord::Migration[5.1]
  def up
    create_table :traps do |table|
      table.string :name, null: false
    end
  end

  def down
    drop_table :traps
  end
end
