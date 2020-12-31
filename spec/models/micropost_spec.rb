require 'rails_helper'

RSpec.describe Micropost, type: :model do
  let(:micropost){FactoryBot.create(:micropost)}

  it "has a valid factory" do
    expect(micropost).to be_valid
  end

  it "投稿内容が空欄であれば無効な状態であること" do
    micropost.content = nil
    expect(micropost.valid?).to eq false
  end

  it "投稿文字数が多ければ無効な状態であること"
  describe 'アソシエーションのテスト'
end
