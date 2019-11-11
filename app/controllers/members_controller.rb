# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_account_by_sign_in_token!

  def index
    @members = Account.all
  end

  def show; end

  private

  def authenticate_account_by_sign_in_token!
    return if account_signed_in?

    email = params[:email].presence
    token = params[:sign_in_token].presence
    account = email && token && Account.find_by(email: email)

    if token && account_signed_in?
      flash.now[:alert] = 'You are already signed in'
    elsif account && token_matches?(account) && token_not_expired?(account)
      flash[:notice] = 'You have successfully signed in to Peak Builders Network'
      sign_in account
    else
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
