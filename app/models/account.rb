# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                    :bigint           not null, primary key
#  address_1             :string
#  address_2             :string
#  anything_else         :string
#  birthday              :date
#  city                  :string
#  email                 :string           not null
#  facebook              :string
#  first_name            :string
#  how_can_you_be_helped :string
#  how_can_you_help      :string
#  instagram             :string
#  last_name             :string
#  linkedin              :string
#  phone_number          :string           not null
#  postal_code           :string
#  profession            :string
#  referrer              :string           not null
#  state                 :string
#  twitter               :string
#  website               :string
#  work_description      :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  join_transaction_id   :string
#

class Account < ApplicationRecord
  phony_normalize :phone_number, default_country_code: 'US'

  validates :email, uniqueness: true, null: false
  validates :referrer, null: false, empty: false

  attr_accessor :payment_method_nonce
end
