require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  subject do
    @user = User.create!(name: 'someone', email: 'user@user.com', password: 'password', id: 1)
    @category = Category.create!(name: 'stationary', icon: @icon_file, user: @user)
  end

  before do
    @icon_file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'test.png'), 'image/png')
    subject
  end

  describe 'GET /index' do
    before(:each) { get categories_path }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before(:each) { get category_path(id: @category.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /new' do
    before(:each) { get new_category_path }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    before(:each) { post categories_path }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /edit' do
    before(:each) { get edit_category_path(id: @category.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /update' do
    before(:each) { put category_path(id: @category.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE /update' do
    before(:each) { delete category_path(id: @category.id) }

    it 'returns http success' do
      follow_redirect!
      expect(response).to have_http_status(:ok)
    end
  end
end
