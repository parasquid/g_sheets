module GSheets
  module V4
    class Row
      attr_reader :data
      def initialize(row_as_hash)
        @data = row_as_hash
      end
    end
  end
end