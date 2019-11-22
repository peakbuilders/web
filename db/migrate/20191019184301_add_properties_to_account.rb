# frozen_string_literal: true

class AddPropertiesToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :profession, :string
    add_column :accounts, :work_description, :string
    add_column :accounts, :how_can_you_help, :string
    add_column :accounts, :how_can_you_be_helped, :string
    add_column :accounts, :anything_else, :string
  end
end
