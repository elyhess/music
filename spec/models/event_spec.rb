require 'rails_helper'

RSpec.describe Event do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should belong_to :venue}
  end

  describe 'instance methods' do
  end
end