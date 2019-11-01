# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_account_by_sign_in_token!

  def show; end

  private

  def authenticate_account_by_sign_in_token!
    email = params[:email].presence
    token = params[:sign_in_token].presence
    account = email && token && Account.find_by(email: email)

    if token && account_signed_in?
      flash.now[:alert] = 'You are already signed in'
    elsif account && token_matches?(account) && token_not_expired?(account)
      flash[:notice] = 'You have signed in successfully'
      account.update_columns(sign_in_token: nil, sign_in_token_sent_at: nil)
      sign_in account
    else
      raise 'hi'
      flash[:alert] = 'Your sign in token is invalid'
      redirect_to main_app.root_path
    end
  end

  def token_matches?(user)
    Devise.secure_compare(
      user.sign_in_token,
      Devise.token_generator.digest(Account, :sign_in_token, params[:sign_in_token])
    )
  end

  def token_not_expired?(user)
    user.sign_in_token_sent_at >= 1_000_000.hours.ago
  end
end
