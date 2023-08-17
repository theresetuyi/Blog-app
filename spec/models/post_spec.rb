require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, title: 'titles', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  context 'when title is not present' do
    before { subject.title = nil }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when comments_counter is not a number' do
    before { subject.comments_counter = 'one' }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'when comments_counter is less than 0' do
    before { subject.comments_counter = -1 }

    it 'is not valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'post_counter_update' do
    let!(:author) { User.create name: 'John', posts_counter: 0 }
    let!(:post) { Post.create author_id: author.id, title: 'teta', comments_counter: 0, likes_counter: 0 }
  end
end
