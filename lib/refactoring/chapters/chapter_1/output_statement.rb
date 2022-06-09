# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class OutputStatement
        def initialize(statement)
          @statement = statement
        end

        def std_out
          result = "Statement for #{statement.customer}\n"
          statement.line_items.each do |line|
            result << "    #{line.play_name}: #{format_amount(line.total_amount / 100)} (#{line.audience} seats)\n"
          end
          result << "Amount owed is #{format_amount(statement.invoice_total / 100)}\n"
          result << "You earned #{statement.volume_credits} credits\n"
        end

        private

        attr_reader :statement

        def format_amount(num)
          format("$%.2f", num)
        end
      end
    end
  end
end
