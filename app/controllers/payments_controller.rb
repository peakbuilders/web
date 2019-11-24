# frozen_string_literal: true

class PaymentsController < ApplicationController
  def new
    @client_token = gateway.client_token.generate
  end

  def create
    redirect_to member_path(current_account)
  end

  private

  def gateway
    env = Figaro.env.braintree_environment!.to_sym

    @gateway ||= Braintree::Gateway.new(
      environment: env,
      merchant_id: Figaro.env.braintree_merchant_id!,
      public_key: Figaro.env.braintree_public_key!,
      private_key: Figaro.env.braintree_private_key!
    )
  end

  def charge
    nonce = params.dig(:account, :payment_method_nonce)

    gateway.transaction.sale(
      amount: 125,
      payment_method_nonce: nonce,
      customer: {
        email: account_params.fetch(:email)
      },
      options: {
        submit_for_settlement: true
      }
    )
  end
end
