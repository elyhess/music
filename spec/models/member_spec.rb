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
end