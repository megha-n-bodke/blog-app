require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) { Like.create(post_id: 1, author_id: 1) }

  it 'Post id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end

  it 'Author id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end
end
