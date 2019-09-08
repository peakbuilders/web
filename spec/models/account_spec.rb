# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                  :bigint           not null, primary key
#  email               :string           not null
#  phone_number        :string           not null
#  referrer            :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  join_transaction_id :string
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
