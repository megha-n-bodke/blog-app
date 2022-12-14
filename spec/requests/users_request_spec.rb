require 'rails_helper'

RSpec.describe 'Users', type: :request do
    describe 'GET /index' do
        it 'gets users' do
            get '/'
            expect(response).to have_http_status(200)
            expect(response.body).to include('Here is list of users')
        end
        end

    describe 'GET /show' do
        it 'gets user' do
            get '/users/1'
            expect(response).to have_http_status(200)
            expect(response.body).to include('List of users by Id')
        end
        end
    end