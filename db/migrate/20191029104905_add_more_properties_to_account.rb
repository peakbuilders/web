class AddMorePropertiesToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :website, :string
    add_column :accounts, :birthday, :date
    add_column :accounts, :twitter, :string
    add_column :accounts, :instagram, :string
    add_column :accounts, :facebook, :string
    add_column :accounts, :linkedin, :string
  end
end
