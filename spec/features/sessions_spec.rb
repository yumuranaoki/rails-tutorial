require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  context 'ログインする際' do
    let(:signed_user) { FactoryBot.create(:signed_user) }

    context '正しい情報を入力した場合' do
      specify 'OKなこと' do 
        visit login_path
        expect(page).to have_content 'Log in'
        fill_in 'Email', with: signed_user.email
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end
    end
  end
end
