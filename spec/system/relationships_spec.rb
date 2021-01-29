require 'rails_helper'

RSpec.describe "Relationships", type: :system do
  let!(:user){FactoryBot.create(:user, name:'user_following')}
  let!(:user_followed){FactoryBot.create(:user, name:'user_followed')}

  before do
    sign_in user
  end


  it 'フォローの一覧画面が表示できる' do
    get following_user_path(user)
    expect(response).to have_http_status(200)
  end
  it 'フォロワーの一覧画面が表示できる' do
    get followers_user_path(user)
    expect(response).to have_http_status(200)
  end


  context 'フォローボタンの動作確認' do
    before do
      visit user_path(user_followed)
    end

    it 'フォローのリクエストが成功する' do
      expect{ click_button 'フォローする' }.to change{ user_followed.followers.count }.by(1)
    end

    it 'フォロー後、フォロー解除のボタンが表示される' do
      click_button 'フォローする'
      expect(page).to have_button 'フォロー解除'
    end
  end


  context 'フォローボタンの動作確認' do
    before do
      Relationship.create(follower_id: user.id, followed_id: user_followed.id)
      visit user_path(user_followed)
    end

    it 'フォロー解除のリクエストが成功する' do
      expect{ click_button 'フォロー解除' }.to change{ user_followed.followers.count }.by(-1)
    end

     it 'フォロー解除後、フォローリクエストのボタンが表示される' do
      click_button 'フォロー解除'
      expect(page).to have_button 'フォローする'
    end
  end
end
