# frozen_string_literal: true

class AccountsController < ApplicationController
  def self.fields
    %i[
      address_1
      address_2
      city
      email
      first_name
      last_name
      postal_code
      phone_number
      referrer
      phone_number
      state
      profession
      work_description
      how_can_you_help
      how_can_you_be_helped
      anything_else
      website
      birthday
      twitter
      instagram
      facebook
      linkedin
    ]
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    password = Devise.friendly_token.first(8)
    params = account_params.merge(password: password)
    @account = Account.new(params)
    @account.save

    unless @account.valid?
      flash.now[:alert] = 'Please fix errors below and try again.'
      return render :new
    end

    sign_in @account
    redirect_to new_payment_path
  end

  def account_params
    params.require(:account).permit(self.class.fields)
  end
end
