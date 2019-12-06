# frozen_string_literal: true

class PaymentsController < ApplicationController
  include Memery

  def self.amount
    return @charge_amount if @charge_amount

    125
  end

  def new
    @client_token = gateway.client_token.generate
  end

  def create
    unless success?
      flash[:notice] = 'Please fix errors and try again.'
      return redirect_to new_payment_path
    end

    current_account.update!(join_transaction_id: charge.transaction.id)
    notify_slack
    redirect_to member_path(current_account)
  end

  private

  def notify_slack
    token = Figaro.env.slack_token!
    return if token == 'none'

    client = Slack::Notifier.new token
    client.ping "New user: #{current_account.email} - #{admin_account_url(current_account)}"
  end

  def success?
    return false unless charge.success?

    charge.transaction
  end

  def gateway
    env = Figaro.env.braintree_environment!.to_sym

    @gateway ||= Braintree::Gateway.new(
      environment: env,
      merchant_id: Figaro.env.braintree_merchant_id!,
      public_key: Figaro.env.braintree_public_key!,
      private_key: Figaro.env.braintree_private_key!
    )
  end

  memoize def charge
    nonce = params.dig(:payment, :payment_method_nonce)

    gateway.transaction.sale(
      amount: self.class.amount,
      payment_method_nonce: nonce,
      customer: {
        email: current_account.email
      },
      options: {
        submit_for_settlement: true
      }
    )
  end
end
