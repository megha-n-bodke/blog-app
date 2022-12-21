require 'rails_helper'

RSpec.describe User, type: :system do
  subject { User.new(name: 'John', posts_counter: 30, photo: 'https://randomuser.me/api/portraits/men/70.jpg', bio: 'Teacher from Poland.') }
  before { subject.save }

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

    it "When I click a user's post, it redirects me to that post's show page." do
      post = Post.create(author: subject, title: 'First Post', text: 'My first post')
      visit user_path(subject.id)
      click_on 'My first post'
      visit user_post_path(subject.id, post.id)
      page.has_content?(post.title)
    end
    it "When I click to see all posts, it redirects me to the user's post's index page." do
      visit user_path(subject.id)
      click_on 'Show all Posts'
      visit user_posts_path(subject.id)
      page.has_content?('John')
    end
  end
end
