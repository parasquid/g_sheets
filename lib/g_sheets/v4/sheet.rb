module GSheets
  module V4
    class Sheet
      def initialize(sheet:, spread_sheet:)
        @sheet = sheet
        @spread_sheet = spread_sheet
        @session = spread_sheet.session
        @sheet_name = sheet.properties.title
      end

      def append(row)
        @session.append_row_to_spreadsheet(
          id: @spread_sheet.id,
          sheet_name: @sheet_name,
          row: row
        )
      end
    end
  end
end