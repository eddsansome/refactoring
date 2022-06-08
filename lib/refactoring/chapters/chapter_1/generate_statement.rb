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
          @play['name']
        end

        attr_reader :total_amount, :volume_credits, :audience

        private

        def add_credit
          @volume_credits += [@audience - 30, 0].max
          @volume_credits += (@audience / 5).floor if @play == "comedy"
        end
        def add_charge
          case @play['type']
          when "tragedy"
            @total_amount = 40_000
            @total_amount += 1000 * (@audience - 30) if @audience > 30
          when "comedy"
            @total_amount = 30_000
            @total_amount += 10_000 + 500 * (@audience - 20) if @audience > 20
            @total_amount += 300 * @audience
          else
            raise "unknown type: #{@play}"
          end
        end
      end

      class Statement
        attr_reader :customer, :line_items

        def initialize(customer:)
          @customer = customer
          @line_items = []
        end

        def add_line_item(play:,audience:)
          @line_items <<  StatementLine.new(play: play, audience: audience).process
        end

        def invoice_total
          @line_items.sum {|line| line.total_amount }
        end

        def volume_credits
          @line_items.sum {|line| line.volume_credits }
        end

      end

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
