require 'rails_helper'
require 'rspec_api_documentation/dsl'

RSpec.resource 'Page' do
  get '/api/pages' do
    let!(:page) { create :page}
    let!(:header) { create :header, level: 1, page_id: page.id}
    let!(:header1) { create :header, level: 2, page_id: page.id}
    let!(:link) { create :link, page_id: page.id}
    response_field :id, "ID of resource"
    response_field :url, "URL of a passed website"
    response_field :headers, "Header resources"
    response_field "headers[:text]", "Content of a heading"
    response_field "headers[:level]", "Identifies if its h1 h2 or h3"
    response_field :links, "Link resources"
    response_field "links[:text]", "Content of a link"

    it 'INDEX' do
      explanation "Lists all pages that are present in the database"
      do_request()
      body   = JSON.parse(response_body)
      expect(status).to eq 200
    end
  end

  get '/api/pages/single' do
    parameter :url, 'URL of a website', required: true

    let!(:page) { create :page}
    let!(:header) { create :header, level: 1, page_id: page.id}
    let!(:header1) { create :header, level: 2, page_id: page.id}
    let!(:link) { create :link, page_id: page.id}
    response_field :id, "ID of resource"
    response_field :url, "URL of a passed website"
    response_field :headers, "Header resources"
    response_field "headers[:text]", "Content of a heading"
    response_field "headers[:level]", "Identifies if its h1 h2 or h3"
    response_field :links, "Link resources"
    response_field "links[:text]", "Content of a link"

    it 'SHOW' do
      explanation "Find a website by url if we have scraped it already"
      do_request(url: 'http://randomusefulwebsites.com')
      body   = JSON.parse(response_body)
      expect(status).to eq 200
    end
  end

  post '/api/pages' do
    parameter :url, 'URL of a website', required: true

    response_field :id, "ID of resource"
    response_field :url, "URL of a passed website"
    response_field :headers, "Header resources"
    response_field "headers[:text]", "Content of a heading"
    response_field "headers[:level]", "Identifies if its h1 h2 or h3"
    response_field :links, "Link resources"
    response_field "links[:text]", "Content of a link"

    it 'CREATE' do
      explanation <<-EOS
        Reads contents of an url and stores information from h1, h2, h3 and a HTML tags.
      EOS
      do_request(url: 'http://randomusefulwebsites.com')

      body   = JSON.parse(response_body)
      expect(status).to eq 201
    end
  end
end
