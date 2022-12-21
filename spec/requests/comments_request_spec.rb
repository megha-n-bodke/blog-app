# require 'rails_helper'

# RSpec.describe 'Comments', type: :request do
#   describe 'GET /new' do
#     it 'returns http success' do
#       get  new_user_post_comment_path(user_id: 1, post_id: 1)
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe 'GET /create' do
#     it 'returns http success' do
#       user = User.create!(name: 'test')
#       post = Post.create!(title: 'test', text: 'test', author_id: user.id)
#       comment = Comment.create!(text: 'test', author_id: user.id, post_id: post.id)

#       post user_post_comments_path(comment)
#       expect(response).to have_http_status(:success)
#     end
#   end
# end
