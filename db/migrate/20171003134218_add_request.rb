class AddRequest < ActiveRecord::Migration[5.1]
  def up
    create_table :requests do |table|
      table.datetime :created_at, null: false
      table.string :remote_ip, null: false
      table.string :request_method, null: false
      table.string :scheme, null: false
      table.string :query_string, null: false
      table.string :query_params
      table.string :cookies
      table.string :headers, null: false
      table.references :trap, foreign_key: true
    end
  end

  def down
    drop_table :requests
  end
end
