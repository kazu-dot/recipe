require 'rails_helper'

RSpec.describe TagMap, type: :model do
  let(:tag_map){FactoryBot.create(:tag_map)}

  it "has a valid factory" do
    expect(tag_map).to be_valid
  end

  it "micropost_idがnilであれば無効な状態であること" do
    tag_map.micropost_id = nil
    expect(tag_map.valid?).to eq false
  end

  it "tag_idがnilであれば無効な状態であること" do
    tag_map.tag_id = nil
    expect(tag_map.valid?).to eq false
  end
end
