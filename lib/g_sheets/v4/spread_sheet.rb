module GSheets
  module V4
    class SpreadSheet
      attr_accessor :id

      def initialize(session:, id:)
        @session = session
        @id = id
      end

      def sheets
        @session.get_sheets_from_spreadsheet(@id).map { |sheet|
          Sheet.new(sheet: sheet, spread_sheet: self)
        }
      end

      def session
        @session
      end
    end
  end
end