require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'joe', photo: 'https://beat.jpg', bio: 'tech') }

  context 'when created' do
    it 'has an id' do
      expect(subject.id).not_to be_nil
    end
  end

  context 'when name is not present' do
    before { subject.name = nil }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when name is present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
