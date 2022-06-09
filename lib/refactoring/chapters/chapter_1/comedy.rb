# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class Comedy < Play
        def calculate_charge
          total_amount = 30_000
          total_amount += 10_000 + 500 * (@audience - 20) if @audience > 20
          total_amount += 300 * @audience
        end

        def calculate_credit
          super + (@audience / 5).floor
        end
      end
    end
  end
end
