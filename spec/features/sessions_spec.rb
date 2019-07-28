require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  context 'ログインする際' do
    let!(:signed_user) { FactoryBot.create(:user) }

    context '正しい情報を入力した場合' do
      specify 'ユーザーのページにリダイレクトされること' do 
        visit login_path
        expect(page).to have_content 'Log in'
        fill_in 'Email', with: signed_user.email
        fill_in 'Password', with: 'password'
        click_button 'Log in'
        expect(current_path).to eq(user_path(signed_user.id))
      end
    end

    context '間違った情報を入力した場合' do
      specify 'エラーメッセージが表示されること' do
        visit login_path
        fill_in 'Email', with: signed_user.email
        fill_in 'Password', with: 'passwowo'
        click_button 'Log in'
        expect(current_path).to eq(login_path)
      end
    end
  end
end
