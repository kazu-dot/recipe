require 'rails_helper'

RSpec.describe "Users", js: true, type: :system do

  it 'ログイン画面が表示されること' do
    visit new_user_session_path
    expect(page).to have_content('メールアドレス')
    expect(page).to have_content('パスワード')
  end

  it 'ログイン失敗時にエラーメッセージが正しく表示される' do
    user = FactoryBot.build(:user)
    visit new_user_session_path

    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button 'ログイン'
    expect(page).to have_content 'メールアドレスかパスワードが違います。'
  end


  it '編集ページでプロフィールを変更できる' do
    user = FactoryBot.create(:user)
    sign_in user
    visit edit_user_registration_path

    expect(page).to have_field '名前', with: "test name"
    fill_in "名前", with: 'いとう'

    click_button '更新する'
    expect(page).to have_content 'アカウントを更新しました'
    expect(page).to have_content 'いとう'
  end



end
