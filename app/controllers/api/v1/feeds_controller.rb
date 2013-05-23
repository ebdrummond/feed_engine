module Api
  module V1
    class FeedsController < ApplicationController
      before_filter :require_api_key
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

      def require_api_key
        user = User.where(:username => params[:username]).first

        if user
          signature = params[:signature]

          uri = "http://www.kreepr.com/api/v1/feeds/#{params[:id]}?username=#{params[:username]}&timestamp=#{params[:timestamp]}"
          uri << "&text_only=#{params[:text_only]}" if params[:text_only]

          answer = OpenSSL::HMAC.hexdigest(OpenSSL::Digest::Digest.new('sha1'), user.api_key.key.to_s, uri)

          unless answer == signature && (Time.now.to_i - params[:timestamp].to_i) < 10
            respond_with "Bad Authentication data"
          end
        end
      end
    end
  end
end
