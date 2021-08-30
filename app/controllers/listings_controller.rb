class ListingsController < ApplicationController
  def index
    @alistings = Listing.order("created_at DESC")
  end

  def new
  end
end
