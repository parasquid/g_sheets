module GSheets
  module V4
    class Session
      def initialize(access_token:, service: Google::Apis::SheetsV4::SheetsService.new)
        @access_token = access_token
        @service = service
        @service.authorization = access_token
      end

      def get_sheets_from_spreadsheet(id)
        service.get_spreadsheet(id).sheets
      end

      def append_row_to_spreadsheet(id:, row:, sheet_name:)
        service.append_spreadsheet_value(
          id,
          sheet_name,
          {"values": [row]},
          value_input_option: "RAW"
        )
      end

      def service
        @service
      end
    end
  end
end
