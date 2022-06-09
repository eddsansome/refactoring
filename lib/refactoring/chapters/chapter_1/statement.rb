# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class Statement
        attr_reader :customer, :line_items

        def initialize(customer:)
          @customer = customer
          @line_items = []
        end

        def add_line_item(play:, audience:)
          @line_items << StatementLine.new(play: play, audience: audience).process
        end

        def invoice_total
          @line_items.sum(&:total_amount)
        end

        def volume_credits
          @line_items.sum(&:volume_credits)
        end
      end
    end
  end
end
