require 'rails_helper'

RSpec.describe Member do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :instrument}
  end

  describe 'relationships' do
    it {should belong_to :band}
  end

  describe 'instance methods' do
  end

  describe 'class method' do
    it '.member_count' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')
      maximus = lewis_del_mar.members.create(name: "Max", instrument:"vocals")
      daniel = lewis_del_mar.members.create(name: "Daniel", instrument:"computer")

      expect(lewis_del_mar.members.member_count).to eq(2)
    end
  end
end