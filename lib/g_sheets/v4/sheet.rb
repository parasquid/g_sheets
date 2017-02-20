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

      def rows
        all_rows = @session.get_spreadsheet_values(
          id: @spread_sheet.id,
          sheet_name: @sheet_name
        ).values

        headers = all_rows[0]
        all_rows.drop(1).map { |row|
          row_as_hash = {}
          headers.zip(row) { |k, v| row_as_hash[k] = v }
          Row.new(row_as_hash)
        }
      end
    end
  end
end