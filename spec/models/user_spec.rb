require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test' do
    it 'downcase public nickname' do
      user = build(:user, nickname: nil)
      user.save
      expect(user.nickname).to eq(user.public_nickname.downcase)
    end

    it 'uniq email' do
      create(:user)
      invalid_user = build(:user)
      invalid_user.valid?
      expect(invalid_user.errors[:email].size).to eq(1)
    end

    it 'uniq nickname' do
      create(:user)
      invalid_user = build(:user)
      invalid_user.valid?
      expect(invalid_user.errors[:nickname].size).to eq(1)
    end

    it 'public_nickname has no err, nickname has err(uniq)' do
      create(:user)
      user = build(:user, public_nickname: 'uSeR')
      user.valid?
      expect(user.errors[:public_nickname].size).to eq(0)
      expect(user.errors[:nickname].size).to eq(1)
    end
  end
end
