# frozen_string_literal: true

require 'rails_helper'

describe 'profiles' do
  describe 'editing' do
    let!(:another_account) { create(:account) }
    let(:account) { create(:account) }

    before do
      sign_in(account)
    end

    it 'allows changing the profile' do
      visit edit_profile_path(account)

      fill_in 'account_first_name', with: 'Bart'
      fill_in 'account_last_name', with: 'Gargamel'
      fill_in 'account_email', with: 'bob@bob.com'
      fill_in 'account_referrer', with: 'Marge'
      fill_in 'account_address_1', with: '234 Flimsey St.'
      fill_in 'account_address_2', with: '#5'
      fill_in 'account_city', with: 'Shelbyville'
      fill_in 'account_state', with: 'MS'
      fill_in 'account_postal_code', with: '99009'
      fill_in 'account_profession', with: 'welder'
      fill_in 'account_twitter', with: 'insane-person'

      expect { click_button 'Update Profile' }.to change { account.reload.first_name }.to('Bart').and \
        change { account.reload.last_name }.to('Gargamel').and \
          change { account.reload.email }.to('bob@bob.com').and \
            change { account.reload.referrer }.to('Marge').and \
              change { account.reload.address_1 }.to('234 Flimsey St.').and \
                change { account.reload.address_2 }.to('#5').and \
                  change { account.reload.city }.to('Shelbyville').and \
                    change { account.reload.state }.to('MS').and \
                      change { account.reload.postal_code }.to('99009').and \
                        change { account.reload.profession }.to('welder').and \
                          change { account.reload.twitter }.to('insane-person')

      expect(page).to have_css('.notice', text: 'Profile updated.')
    end
  end
end
