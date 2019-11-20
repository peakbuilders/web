class AddAddressToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :address_1, :string
    add_column :accounts, :address_2, :string
    add_column :accounts, :city, :string
    add_column :accounts, :state, :string
    add_column :accounts, :postal_code, :string
  end
end
