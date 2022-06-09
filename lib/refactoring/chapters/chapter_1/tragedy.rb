# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class Tragedy < Play
        def calculate_charge
          total_amount = 40_000
          total_amount += 1000 * (@audience - 30) if @audience > 30
        end
      end
    end
  end
end
