class AddOptinToUsers < ActiveRecord::Migration
  def change
    add_column :users, :opt_in, :boolean
  end
end
