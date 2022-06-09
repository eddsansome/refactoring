# frozen_string_literal: true


module Refactoring
  module Chapters
    module Chapter1

      class GenerateStatement
        def self.call(...)
          new(...).call
        end

        def initialize(invoice:, plays:)
          @invoice = invoice
          @plays = plays
        end

        def call
          statement = Statement.new(customer: invoice['customer'])
          invoice["performances"].each do |perf|
            statement.add_line_item(play: play(perf["playID"]), audience: perf["audience"])
          end
          OutputStatement.new(statement).std_out
        end

        private

        def play(play_id)
          plays[play_id]
        end

        attr_reader :invoice, :plays

      end
    end
  end
end
