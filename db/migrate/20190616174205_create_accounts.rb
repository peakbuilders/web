# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, unique: true
      t.string :phone_number, null: false, unique: true
      t.string :referrer, null: false

      t.timestamps
    end
  end
end
