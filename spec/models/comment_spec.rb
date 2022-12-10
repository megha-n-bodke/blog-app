require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { Comment.create(post_id: 1, author_id: 1, text: 'First comment') }

  it 'Post id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'Author id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'Text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'Text should not be too long' do
    subject.text = 'a' * 501
    expect(subject).to_not be_valid
  end
end
