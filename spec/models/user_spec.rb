require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){FactoryBot.create(:user)}

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "メールアドレスが適切なフォーマットで無ければ無効な状態であること"
  it "ユーザーが削除されたとき、投稿は破棄されていること"


  it "名前がなければ無効な状態であること" do
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end

   it "名前が長過ぎれば無効な状態であること"

  it "メールアドレスがなければ無効な状態であること" do
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end


  it "重複したメールアドレスなら無効な状態であること" do
    FactoryBot.create(:user, email: "dupulicated@example.com")
    user = FactoryBot.build(:user, email: "dupulicated@example.com")

    expect(user).to_not be_valid
  end



end
