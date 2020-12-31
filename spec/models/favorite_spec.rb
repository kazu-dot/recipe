require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite){FactoryBot.create(:favorite)}

  it "has a valid factory" do
    expect(favorite).to be_valid
  end

  it "重複したメールアドレスなら無効な状態であること" do
    favorite_duplicated = favorite.dup
    expect(favorite_duplicated).to_not be_valid
  end

  # describe 'アソシエーションのテスト'

  # it "generates associated data from a factory" do
  #   note = FactoryBot.create(:favorite)
  #   puts "This note's project is #{favorite.project.inspect}"
  #   puts "This note's user is #{favorite.user.inspect}"
  # end
end
