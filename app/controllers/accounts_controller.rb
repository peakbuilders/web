# frozen_string_literal: true

class AccountsController < ApplicationController
  def new
    @account = Account.new
    @client_token = gateway.client_token.generate
  end

  def create
    result = charge

    if result.success? || result.transaction
      redirect_to '/member'
    else
      error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
      flash[:error] = error_messages
      redirect_to new_account_path
    end
  end

  def gateway
    env = Figaro.env.braintree_environment!.to_sym

    @gateway ||= Braintree::Gateway.new(
      environment: env,
      merchant_id: Figaro.env.braintree_merchant_id!,
      public_key: Figaro.env.braintree_public_key!,
      private_key: Figaro.env.braintree_private_key
    )
  end

  private

  def charge
    nonce = params.dig(:account, :payment_method_nonce)

    gateway.transaction.sale(
      amount: 125,
      payment_method_nonce: nonce,
      options: {
        submit_for_settlement: true
      }
    )
  end
end
