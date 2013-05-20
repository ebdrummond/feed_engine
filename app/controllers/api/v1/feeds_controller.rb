module Api
  module V1
    class FeedsController < ApplicationController
      before_filter :find_trip
      respond_to :json

      def show
        trip_feed = TripFeed.new(:trip => @trip)

        if params[:only_text]
          respond_with trip_feed.notes
        else
          respond_with trip_feed.feed
        end
      end

      private

      def find_trip
        @trip = Trip.find(params[:id])
      end
    end
  end
end
