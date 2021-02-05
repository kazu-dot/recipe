require 'rails_helper'

RSpec.describe "Microposts", type: :system do
  let(:user){FactoryBot.create(:user)}

  before do
    sign_in user
  end

  it '投稿画面が表示されること' do
    visit root_path(user)
    click_link 'レシピを投稿する'

    expect(page).to have_content('レシピを投稿する')
    expect(page).to have_content('料理名')
    expect(page).to have_content('詳細')
  end

  it '投稿失敗時にエラーメッセージが正しく表示される' do
    visit new_micropost_path(user)
    fill_in "料理名", with: nil
    fill_in "詳細", with: nil
    click_button '投稿する'

    expect(page).to have_content '投稿に失敗しました'
    expect(page).to have_content '料理名を入力してください'
    expect(page).to have_content '詳細を入力してください'
  end

  it '有効な投稿が成功する' do
    visit new_micropost_path(user)
    fill_in "料理名", with: "ヴィシソワーズ"
    fill_in "詳細", with: "ジャガイモをミキサーにかけて牛乳を加えて温める"
    expect{ click_button '投稿する' }.to change{ user.microposts.count }.by(1)
  end

  it '自分の投稿が削除できる'
  it '他の人の投稿は削除できない'
end
