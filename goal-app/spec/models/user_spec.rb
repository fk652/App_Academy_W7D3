# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password)}
  it { should validate_length_of(:password).is_at_least(4)}

  describe 'uniqueness' do
    before :each do 
      create(:user)
    end

    it { should validate_uniqueness_of(:username) }
  end

  describe 'User::find_by_credentials' do 
    # subject { User.create!(username: 'Hinata', password: 'narutoo') }
    # before :each do 
    #   create(:michaels_waifu)
    # end
    let(:waifu) { create(:michaels_waifu) }
    

    it 'should return the correct user and return nil for invalid credentials' do
      # waifu = create(:michaels_waifu)
      waifu.save!
      expect(User.find_by_credentials('Hinata', 'narutoo')).to eq(waifu)
      expect(User.find_by_credentials('Sasuke', 'asdf')).to eq(nil)
    end
  end
end
