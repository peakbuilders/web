# frozen_string_literal: true

module Admin
  class AccountsController < Admin::ApplicationController
    def create
      resource = resource_class.new(resource_params.merge(password: Devise.friendly_token.first(8)))
      authorize_resource(resource)

      if resource.save
        redirect_to(
          [namespace, resource],
          notice: translate_with_resource('create.success')
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource)
        }
      end
    end
  end
end
