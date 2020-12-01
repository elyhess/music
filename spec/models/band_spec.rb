require 'rails_helper'

RSpec.describe Band do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :members}
  end

  describe 'instance methods' do
  end
end