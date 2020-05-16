class ListingsController < ApplicationController

    before_action :authenticate_user!

    def index
        @listings = Listing.all
    end

    def new
        @listing = Listing.new
        @lams = Listing.lams.keys
    end

end