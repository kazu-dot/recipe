require 'rails_helper'

RSpec.describe Micropost, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:micropost)).to be_valid
  end

  it "投稿内容が空欄であれば無効な状態であること" do
    micropost = FactoryBot.build(:micropost, content: nil)
    expect(micropost.valid?).to eq false
  end

  it "投稿文字数が多ければ無効な状態であること"
  describe 'アソシエーションのテスト'
end
