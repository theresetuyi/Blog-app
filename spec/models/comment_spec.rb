require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(user_id: 1, text: 'never giverup', post_id: 3) }

  before { subject.save }

  it 'text should be present' do
    subject.text = 'never giveup'
    expect(subject).to_not be_valid
  end
end
