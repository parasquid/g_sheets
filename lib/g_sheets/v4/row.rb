module GSheets
  module V4
    attr_reader :data
    class Row
      def initialize(row_as_hash)
        @data = row_as_hash
      end
    end
  end
end