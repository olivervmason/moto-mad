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

        if @listing.errors.any?
            set_new_listing_variables
            render "new"
            puts @listing.errors.full_messages  
        else
            redirect_to listings_path            
        end
        # render json: params
    end

    def show
        @listing = Listing.find(params["id"])
    end

    def edit
        @listing = Listing.find(params["id"])
        set_new_listing_variables
    end

    def destroy
        render json: "Destroy method"
    end

    private

    def listing_parameters
        params.require(:listing).permit(:title, :manufacturer, :model, :style, :price, :location, :mileage, :lams, :description, :engine, :year, :picture)
    end

    def set_new_listing_variables
        @lams = Listing.lams.keys    
    end
end