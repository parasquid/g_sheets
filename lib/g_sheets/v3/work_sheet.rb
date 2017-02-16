module GSheets
  module V3
    class WorkSheet
      def initialize(session:, grid_id: " default", id:)
        @grid_id = grid_id
        @session = session
        @id = id
      end

      def headers
        cells_first_row["feed"]["entry"].map {|e| e["content"]["$t"]}
      end

      def rows
        data_list = worksheet_as_list["feed"]["entry"]
        list = data_list.map {|entry|
          [
            "title: #{entry['title']['$t']}",
            entry["content"]["$t"]
          ].join(", ")
        }

        result = []
        list.each do |l|
          row = {}
          l.split(",").each do |elem|
            e = elem.split(":")
            row[e.first.strip.freeze] = e.last.strip.freeze
          end
          result << row
        end
        result.map(&:values)
      end

      private

      def cells_first_row
        JSON.parse(@session.get_cells(id: @id, grid_id: @grid_id, options: header_row_options).body)
      end

      def worksheet_as_list
        JSON.parse(@session.get_list(id: @id, grid_id: @grid_id).body)
      end

      def header_row_options
        ["min-row=1", "max-row=1"]
      end
    end
  end
end
