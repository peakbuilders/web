# frozen_string_literal: true

require 'administrate/base_dashboard'

class AccountDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    phone_number: Field::String,
    referrer: Field::String,
    join_transaction_id: Field::String,

    first_name: Field::String,
    last_name: Field::String,
    address_1: Field::String,
    address_2: Field::String,
    city: Field::String,
    state: Field::String,
    postal_code: Field::String,

    profession: Field::String,
    work_description: Field::String,
    how_can_you_help: Field::String,
    how_can_you_be_helped: Field::String,
    anything_else: Field::String,

    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    email
    phone_number
    referrer
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    phone_number
    referrer
    join_transaction_id
    first_name
    last_name
    address_1
    address_2
    city
    state
    postal_code
    profession
    work_description
    how_can_you_help
    how_can_you_be_helped
    anything_else
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    email
    phone_number
    referrer
    first_name
    last_name
    address_1
    address_2
    city
    state
    postal_code
    profession
    work_description
    how_can_you_help
    how_can_you_be_helped
    anything_else
  ].freeze

  # Overwrite this method to customize how accounts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(account)
  #   "Account ##{account.id}"
  # end
end
