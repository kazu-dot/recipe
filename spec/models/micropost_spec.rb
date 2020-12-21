require 'rails_helper'

RSpec.describe Micropost, type: :model do

  it "投稿内容が空欄であれば無効な状態であること" do
    micropost = FactoryBot.build(:micropost, content: nil)
    micropost.valid?
    expect(micropost.errors[:micropost]).to include("が入力されていません。")
  end

  it "投稿文字数が多ければ無効な状態であること"
  describe 'アソシエーションのテスト'
end
