require 'rails_helper'

RSpec.describe "Comments", type: :system do
  let(:user){FactoryBot.create(:user)}
  let!(:micropost){FactoryBot.create(:micropost)}

  context 'コメントの動作確認' do
    before do
      sign_in user
      visit root_path(user)
      click_link micropost.title
    end

    it 'コメントフォームが表示されること' do
      expect(page).to have_content(micropost.title)
      expect(page).to have_button('コメントする')
    end

    it 'コメント失敗時にエラーメッセージが正しく表示される' do
      fill_in "コメント", with: nil
      click_button 'コメントする'
      expect(page).to have_content 'コメント投稿に失敗しました'
    end

    it '有効なコメントが成功する' do
      comment = "すごいですね! 僕も作ってみます!!"
      fill_in "コメント", with: comment
      expect{ click_button 'コメントする' }.to change{ micropost.comments.count }.by(1)
      expect(page).to have_content(comment)
    end
  end

  context 'コメント削除の動作確認' do
    let!(:comment){FactoryBot.create(:comment)}

    it '自分のコメントが削除できる' do
      user_A = comment.user
      sign_in user_A
      visit micropost_path(comment.micropost)
      expect{ click_button 'コメントを削除する' }.to change{ user_A.comments.count }.by(-1)
     end

    it '他の人のコメントは削除できない' do
      sign_in user
      visit micropost_path(comment.micropost)
      expect(page).to have_no_button('コメントを削除する')
    end
  end
end
