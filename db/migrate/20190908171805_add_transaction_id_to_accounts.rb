# frozen_string_literal: true

class AddTransactionIdToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :join_transaction_id, :string
  end
end
