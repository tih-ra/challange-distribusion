class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :passphrase_digest
      t.integer :source
      t.integer :start_node
      t.integer :end_node
      t.datetime :start_time_ts
      t.datetime :end_time_ts
    end
  end
end
