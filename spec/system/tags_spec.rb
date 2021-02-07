require 'rails_helper'

RSpec.describe "Tags", type: :system do
  let(:user){FactoryBot.create(:user)}


  before do
    sign_in user
    @micropost = FactoryBot.build(:micropost)
  end

  it '有効な投稿が成功する' do
    visit new_micropost_path(user)
    fill_in "料理名", with: @micropost.title
    fill_in "詳細", with: @micropost.content
    fill_in "タグ", with: "洋食"
    click_button '投稿する'

    visit user_path(user)
    click_link @micropost.title
    expect(page).to have_content '洋食'
  end
end
