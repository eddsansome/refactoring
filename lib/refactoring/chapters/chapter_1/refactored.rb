# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class Refactored
        def self.call(invoice:, plays:)
          GenerateStatement.call(invoice: invoice.first, plays: plays)
        end
      end
    end
  end
end
