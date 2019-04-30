class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
      end
    
      def show
        @attraction = Attraction.find(params[:id])
      end
    
      def ride
        flash[:alert] = Ride.create(ride_params).take_ride
    
        redirect_to user_path(current_user)
      end
    
      def new
        @attraction = Attraction.new
      end
    
      def create
        attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(attraction)
      end
    
      def edit
        @attraction = Attraction.find(params[:id])
      end

      def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
      end
    
      private
    
      def ride_params
        params.permit(:user_id, :attraction_id)
      end
    
      def attraction_params
        params.require(:attraction).permit(:name, :min_height,
                                          :happiness_rating, :nausea_rating, :tickets)
      end
end
