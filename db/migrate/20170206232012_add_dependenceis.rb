class AddDependenceis < ActiveRecord::Migration[5.0]
  def change
    add_column :headers, :page_id, :integer
    add_column :links, :page_id, :integer
  end
end
