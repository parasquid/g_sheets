module GSheets
  module V3
    class Session
      def initialize(access_token:, http_client: Faraday, alt: "json")
        @access_token = access_token
        @alt = alt
        @http_client = http_client
      end

      def get_cells(id:, grid_id: "default", options:[])
        connection.get "cells/#{id}/#{grid_id}/private/full?#{options.join('&')}"
      end

      def get_list(id:, grid_id: "default", options:[])
        connection.get "list/#{id}/#{grid_id}/private/full?#{options.join('&')}"
      end

      def get_worksheets(id:)
        connection.get "worksheets/#{id}/private/full"
      end

      def connection
        @http_client.new "#{sheets_api_endpoint}?access_token=#{@access_token}&alt=#{@alt}"
      end

      private

      def sheets_api_endpoint
        "https://spreadsheets.google.com/feeds"
      end
    end
  end
end
