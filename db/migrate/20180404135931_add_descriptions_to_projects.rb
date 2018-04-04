class AddDescriptionsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :short_description, :string,  null: false, default: ''
    add_column :projects, :description, :string,        null: false, default: ''
  end
end
