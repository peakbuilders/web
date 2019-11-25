# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_account!

  def edit
    @account = current_account
  end

  def update
    @account = current_account
    @account.update(account_params)

    unless @account.valid?
      flash.now[:alert] = 'Please fix errors below and try again.'
      return render :edit
    end

    flash[:notice] = 'Profile updated.'
    redirect_to member_path(@account)
  end

  private

  def account_params
    params.require(:account).permit(AccountsController.fields)
  end
end
