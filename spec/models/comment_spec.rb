require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment){FactoryBot.create(:comment)}

  it "has a valid factory" do
    expect(comment).to be_valid
  end

  it "投稿内容が空欄であれば無効な状態であること" do
    comment.content = nil
    expect(comment.valid?).to eq false
  end

  it "投稿文字数が多ければ無効な状態であること" do
    comment.content = 'a' * 201
    expect(comment.valid?).to eq false
  end
end
