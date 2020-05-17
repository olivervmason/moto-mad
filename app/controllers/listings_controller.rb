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
    end

    def show
        @listing = Listing.find(params["id"])
    end

    def edit
        set_new_listing_variables
        @listing = current_user.listings.find_by_id(params["id"])

        if @listing
            render("edit") 
        else
            redirect_to listings_path
        end
    end

    def update
        @lams = Listing.lams.keys
        @listing = current_user.listings.find_by_id(params["id"])
        if @listing
            @listing.update(listing_parameters)
            if @listing.errors.any? 
                render "edit"
            else
                redirect_to listings_path
            end
        else 
            redirect_to listings_path             
        end
    end

    def destroy
        @listing = current_user.listings.find_by_id(params["id"])
        if @listing 
            @listing.destroy
        end
        redirect_to listings_path
    end

    private

    def listing_parameters
        params.require(:listing).permit(:title, :manufacturer, :model, :style, :price, :location, :mileage, :lams, :description, :engine, :year, :picture)
    end

    def set_new_listing_variables
        @lams = Listing.lams.keys    
    end
end