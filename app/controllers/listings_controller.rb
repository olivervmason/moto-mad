class ListingsController < ApplicationController

    before_action :authenticate_user!

    def index
        @listings = Listing.all

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: "Donation to MadMoto",
                currency: 'nzd',
                quantity: 1,
                amount: 1000
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}",
            cancel_url: "#{root_url}listings"
        )    
        @session_id = session.id
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
            redirect_to listing_path(@listing.id)
            # redirect_to listings_path            
        end
    end

    def show
        @listing = Listing.find(params["id"])
        @question = Question.new
        @questions = Question.all
        @answer = Answer.new
        @answers = Answer.all
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