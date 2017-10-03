class AddRequest < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |table|
      table.datetime :created_at
      table.string :remote_ip
      table.string :request_method
      table.string :scheme
      table.string :query_string
      table.string :query_params
      table.string :cookies
      table.string :headers
      table.references :trap, foreign_key: true
    end
  end
end
