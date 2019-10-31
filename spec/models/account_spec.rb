# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                     :bigint           not null, primary key
#  address_1              :string
#  address_2              :string
#  anything_else          :string
#  birthday               :date
#  city                   :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  facebook               :string
#  first_name             :string
#  how_can_you_be_helped  :string
#  how_can_you_help       :string
#  instagram              :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  linkedin               :string
#  phone_number           :string           not null
#  postal_code            :string
#  profession             :string
#  referrer               :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  state                  :string
#  twitter                :string
#  website                :string
#  work_description       :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  join_transaction_id    :string
#
# Indexes
#
#  index_accounts_on_email                 (email) UNIQUE
#  index_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
