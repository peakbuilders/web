# frozen_string_literal: true

require 'rails_helper'

describe 'admin' do
  let(:valid_authentication_header) do
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('admin', Figaro.env.admin_password!)
    }
  end

  describe 'authentication' do
    let(:account) { create(:account, password: password) }
    let(:password) { 'abc123' }

    before do
      get admin_root_path, headers: authentication_header
    end

    context 'with admin privileges' do
      let(:authentication_header) { valid_authentication_header }

      it 'does not allow access to standard accounts' do
        expect(response.body).to include('Accounts')
      end
    end

    context 'without admin privileges' do
      let(:authentication_header) { {} }

      it 'does not allow access to standard accounts' do
        expect(response.body).to_not include('Accounts')
      end
    end
  end

  describe 'accounts' do
    let(:authentication_header) { valid_authentication_header }
    let(:new_account) { build(:account) }

    it 'creates a new user' do
      post admin_accounts_path, params: { account: {
        email: new_account.email,
        phone_number: new_account.phone_number,
        referrer: new_account.referrer,
        first_name: new_account.first_name,
        last_name: new_account.last_name,
        address_1: new_account.address_1,
        city: new_account.city,
        state: new_account.state,
        postal_code: new_account.postal_code,
        profession: new_account.profession
      } }, headers: authentication_header
      expect(response.body).to redirect_to(admin_account_path(Account.last.id))
    end
  end
end
