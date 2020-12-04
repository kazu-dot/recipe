require 'rails_helper'

RSpec.describe User, type: :model do


  it "名前、メール、パスワードがあれば有効な状態であること" do
    user = User.new(
      username: "RYO",
      email: "example@hogehoge.com",
      password: "password123@",
    )
    expect(user).to be_valid
  end


  it "名前がなければ無効な状態であること" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "名前が長過ぎれば無効な状態であること"

  it "メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "メールアドレスが適切なフォーマットで無ければ無効な状態であること"

  it "重複したメールアドレスなら無効な状態であること" do
    other_user = User.create(
      username: "RYO",
      email: "example@hogehoge.com",
      password: "password123@",
    )

    user = User.new(
      username: "DAIKI",
      email: "example@hogehoge.com",
      password: "password123@",
    )

    expect(user).to_not be_valid
  end



end
