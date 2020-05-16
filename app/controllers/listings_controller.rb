class ListingsController < ApplicationController

    before_action :authenticate_user!

    def index
        # render json: "ListingsIndex"
        @listings = Listing.all
    end

end