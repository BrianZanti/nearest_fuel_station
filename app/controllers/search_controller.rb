class SearchController < ApplicationController
  def index
    render locals: {
      search_results: SearchResults.new(params[:location])
    }
  end
end
