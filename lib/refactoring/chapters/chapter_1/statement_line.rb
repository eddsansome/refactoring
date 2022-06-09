# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class StatementLine
        def initialize(play:, audience:)
          @play = play
          @audience = audience
          @total_amount = 0
          @volume_credits = 0
        end

        def process
          add_credit
          add_charge
          self
        end

        def play_name
          @play["name"]
        end

        attr_reader :total_amount, :volume_credits, :audience

        private

        def add_credit
          @volume_credits = play_type.calculate_credit
        end

        def add_charge
          @total_amount = play_type.calculate_charge
        end

        def play_type
          @play_type ||= Object.const_get("Refactoring::Chapters::Chapter1::#{@play["type"].capitalize}")
                               .new(audience: @audience)
        end
      end
    end
  end
end
