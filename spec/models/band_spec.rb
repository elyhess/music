require 'rails_helper'

RSpec.describe Band do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :members}
  end

  describe 'instance methods' do
    it '#date_format' do
      lewis_del_mar = Band.create(name: "Lewis Del Mar", booked: true, created_at: 'Thu, 03 Dec 2020 19:24:11 UTC +00:00')

      expect(lewis_del_mar.date_added).to eq("12/03/2020 19:24")
    end
  end
end