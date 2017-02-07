require 'rails_helper'

RSpec.describe PagesController do
  def json_response
    JSON.parse(response.body)
  end
  describe '#index' do
    it 'should return all resources' do
      post :create, params: {url: 'http://w3schools.com/html/tryit.asp?filename=tryhtml_headings'}
      post :create, params: {url: 'http://delfi.lt'}
      get :index
      expect(json_response.count).to eq (2)
    end
  end

  describe '#create' do
    it 'should create a page' do
      post :create, params: {url: 'http://w3schools.com/html/tryit.asp?filename=tryhtml_headings'}

      expect(response.status).to eq(201)
      expect(json_response['url']).to eq('http://w3schools.com/html/tryit.asp?filename=tryhtml_headings')

      page = Page.find(json_response['id'])
      expect(page.headers.count).to eq 9
      expect(page.links.count).to eq 6
    end

    it 'should fail with bad url' do
      expect {
        post :create, params: {url: 'google.com'}        
      }.to raise_error(ActionController::BadRequest)
    end

    it 'should format to a non-www url' do
      post :create, params: {url: 'http://www.delfi.lt'}
      expect(json_response['url']).to eq('http://delfi.lt')
      expect(response.status).to eq(201)
    end
  end

  describe '#show' do
    it 'should return a single resource' do
      post :create, params: {url: 'http://delfi.lt'}
      post :create, params: {url: 'http://w3schools.com/html/tryit.asp?filename=tryhtml_headings'}
      get :show, params: {url: 'http://delfi.lt'}
      expect(json_response['id']).to eq 1
      expect(json_response['url']).to eq "http://delfi.lt"
    end
  end
end