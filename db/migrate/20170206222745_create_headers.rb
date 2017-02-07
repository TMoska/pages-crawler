class CreateHeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :headers do |t|
      t.string :text
      t.integer :level
      t.timestamps
    end
  end
end
