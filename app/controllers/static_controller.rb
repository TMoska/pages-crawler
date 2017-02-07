require 'rails/application_controller'

class StaticController < Rails::ApplicationController
  def index
    render file: Rails.root.join('doc', 'api', 'index.html')
  end
  def create
    render file: Rails.root.join('doc', 'api', 'page', 'create.html')
  end
  def show
    render file: Rails.root.join('doc', 'api', 'page', 'show.html')
  end
  def index_doc
    render file: Rails.root.join('doc', 'api', 'page', 'index.html')
  end
end
