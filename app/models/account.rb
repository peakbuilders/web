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
#  outbound_sign_in_token :string
#  phone_number           :string           not null
#  postal_code            :string
#  profession             :string
#  referrer               :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  sign_in_token          :string
#  sign_in_token_sent_at  :datetime
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

class Account < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  phony_normalize :phone_number, default_country_code: 'US'

  after_save :generate_outbound_magic_token

  validates :email, uniqueness: true, null: false, presence: true
  validates :referrer, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :profession, presence: true

  attr_accessor :payment_method_nonce

  def magic_link
    Rails.application.routes.url_helpers.member_url(self, email: email, sign_in_token: outbound_sign_in_token)
  end

  private

  def generate_outbound_magic_token
    return if sign_in_token

    raw, enc = Devise.token_generator.generate(self.class, :sign_in_token)

    update!(sign_in_token: enc, sign_in_token_sent_at: Time.zone.now, outbound_sign_in_token: raw)
  end
end
