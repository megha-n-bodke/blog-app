require 'rails_helper'

RSpec.describe User, type: :system do
  subject { User.new(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from Poland.') }
  before { subject.save }

  describe 'index page' do
    it "I can see the user's username." do
      visit users_path
      page.has_content?(subject.name)
    end

    it "I can see the user's profile picture." do
      visit users_path
      page.has_css?('.img-fluid')
    end

    it 'I can see the number of posts the user has written.' do
      visit users_path
      page.has_content?(subject.posts_counter)
    end

    it 'I can see the user\'s bio.' do
      visit users_path
      page.has_content?(subject.bio)
    end

    it "when i click on a user's name, it redirects me to that user's profile page." do
      User.delete_all
       User.create(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/port',
                         bio: 'Teacher from Poland.')
      visit users_path
    end
  end

  describe 'show page' do
    it "I can see the user's username." do
      visit user_path(subject.id)
      page.has_content?(subject.name)
    end

    it "I can see the user's profile picture." do
      visit user_path(subject.id)
      page.has_css?('.img-fluid')
    end

    it 'I can see the number of posts the user has written.' do
      visit user_path(subject.id)
      page.has_content?(subject.posts_counter)
    end

    it 'I can see the user\'s bio.' do
      visit user_path(subject.id)
      page.has_content?(subject.bio)
    end

    it 'I can see the user\'s posts.' do
      post = Post.create(author_id: subject.id, title: 'First Post', text: 'My first post', comments_counter: 20,
                         likes_counter: 30)
      visit user_path(subject.id)
      page.has_content?(post.title)
    end

    it "I can see a button that lets me view all of a user's posts." do
      visit user_path(subject.id)
      page.has_button?('Show all Posts')
    end
  end
end
