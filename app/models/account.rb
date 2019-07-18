# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  email        :string           not null
#  phone_number :string           not null
#  referrer     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Account < ActiveRecord::Base
  self.abstract_class = false

  phony_normalize :phone_number, default_country_code: 'US'

  validates :email, uniqueness: true, null: false
  validates :referrer, null: false, empty: false

  attr_accessor :payment_method_nonce
end
