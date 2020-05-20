class ListingsController < ApplicationController

    before_action :authenticate_user!

    def index
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
        @lams = Listing.lams.keys
        set_manufacturer_style_and_locations
    end

    def create
        set_manufacturer_style_and_locations
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
        @question = Question.new
        @questions = Question.all
        @answer = Answer.new
        @answers = Answer.all
        # @q_answer = Answer.find(params["id"])
    end

    def edit
        set_new_listing_variables
        set_manufacturer_style_and_locations
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
        params.require(:listing).permit(:title, :manufacturer_id, :model, :style_id, :price, :location_id, :mileage, :lams, :description, :engine, :year, :picture)
    end

    def set_new_listing_variables
        @lams = Listing.lams.keys    
    end

    def set_manufacturer_style_and_locations
        @manufacturer = Manufacturer.all
        @style = Style.all
        @location = Location.all
    end

end