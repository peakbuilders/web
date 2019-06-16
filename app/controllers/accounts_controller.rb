# frozen_string_literal: true

class AccountsController < ApplicationController
  def new
    @account = Account.new
    @client_token = gateway.client_token.generate
  end

  def create; end

  def gateway
    env = Figaro.env.braintree_environment!.to_sym

    @gateway ||= Braintree::Gateway.new(
      environment: env,
      merchant_id: Figaro.env.braintree_merchant_id!,
      public_key: Figaro.env.braintree_public_key!,
      private_key: Figaro.env.braintree_private_key
    )
  end
end
