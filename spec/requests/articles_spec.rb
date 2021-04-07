require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /articles' do
    fixtures :articles

    it 'Should GET all articles' do
      get articles_path
      expect(response).to have_http_status(200)
      assert_select 'td', 'Lorem body 1'
    end

    it 'Should GET single article' do
      get article_path(1)
      expect(response).to have_http_status(200)
      expect(response.body).to include('Lorem body')
    end
  end
end
