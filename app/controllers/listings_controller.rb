class ListingsController < ApplicationController

    before_action :authenticate_user!

    def index
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
        @lams = Listing.lams.keys
    end

    def create
        @listing = current_user.listings.create(listing_parameters)
        puts @listing.errors.full_messages  
        redirect_to listings_path
        # render json: params
    end

    private

    def listing_parameters
        params.require(:listing).permit(:title, :manufacturer, :model, :style, :price, :location, :mileage, :lams, :description, :engine, :year, :picture)
    end
end