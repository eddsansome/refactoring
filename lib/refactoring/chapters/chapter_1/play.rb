# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class Play
        def initialize(audience:)
          @audience = audience
        end

        def calculate_charge
          raise "use the child class pls"
        end

        def calculate_credit
          [@audience - 30, 0].max
        end
      end
    end
  end
end
