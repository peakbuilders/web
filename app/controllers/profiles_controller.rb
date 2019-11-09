class ProfilesController < ApplicationController
  def edit
    @account = current_account
  end
end
