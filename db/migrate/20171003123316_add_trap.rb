class AddTrap < ActiveRecord::Migration[5.1]
  def change
    create_table :traps do |table|
      table.string :name
    end
  end
end
