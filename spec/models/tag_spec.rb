require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag){FactoryBot.create(:tag)}

  it "has a valid factory" do
    expect(tag).to be_valid
  end

  it "タグ名が空欄であれば無効な状態であること" do
    tag.tag_name = nil
    expect(tag.valid?).to eq false
  end

  it "タグ名が多ければ無効な状態であること" do
    tag.tag_name = 'a' * 21
    expect(tag.valid?).to eq false
  end
end
