require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', posts_counter: 10) }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be present' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be an integer' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
