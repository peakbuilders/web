# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_account!

  def edit
    @account = current_account
  end
end
