require "open-uri"
require 'uri'

class PagesController < ApplicationController
  before_action :validate_url, only: [:show, :create]

  def index
    render json: Page.all, status: 200
  end

  def show
    if (page = Page.find_by(url: url_params[:url]))
      render json: page, status: 200
    else
      render status: 404
    end
  end

  def create
    body = URI.parse(params[:url]).read
    page_data = Nokogiri::HTML(body)
    if (!(page = Page.find_by(url: params[:url])))
      page = Page.create(url_params)
      page.create_heads_and_links(page_data, page.id)
      render json: page, status: 201
    else
      page.update_heads_and_links(page_data, page.id)
      render json: page, status: 200
    end
  end

  private
  def url_params
    params.permit(:url)
  end

  def validate_url
    unless (valid_url?(url_params[:url]))
      raise ActionController::BadRequest, 'Url must be in format of: http(s)://example.come'
    end
    params[:url] = format_url(params[:url])
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  def format_url(url)
    url.downcase
    url = (url.include?("//www.")) ? url.gsub("//www.", "//") : url
    return (url)
  end
end

