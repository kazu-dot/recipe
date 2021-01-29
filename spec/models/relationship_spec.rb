require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user){FactoryBot.create(:user)}
  let(:other_user){FactoryBot.create(:user)}
  let(:relationship) { user.active_relationships.build(followed_id: other_user.id) }

  it "has a valid factory" do
    expect(relationship).to be_valid
  end

  it "投稿内容が空欄であれば無効な状態であること" do
    relationship.followed_id = nil
    expect(relationship.valid?).to eq false
  end
end
