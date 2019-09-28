# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                  :bigint           not null, primary key
#  address_1           :string
#  address_2           :string
#  city                :string
#  email               :string           not null
#  first_name          :string
#  last_name           :string
#  phone_number        :string           not null
#  postal_code         :string
#  referrer            :string           not null
#  state               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  join_transaction_id :string
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
