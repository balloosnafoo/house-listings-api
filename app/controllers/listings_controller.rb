class ListingsController < ApplicationController
  def index
    @listings = Listing.filter_by_query(params)
    render :index
  end
end
