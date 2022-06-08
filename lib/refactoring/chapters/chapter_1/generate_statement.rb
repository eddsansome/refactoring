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
          total_amount = 0
          volume_credits = 0
          result = "Statement for #{invoice["customer"]}\n"

          invoice["performances"].each do |perf|
            play = plays[perf["playID"]]

            this_amount = amount_for(perf, play)

            # add volume credits
            volume_credits += [perf["audience"] - 30, 0].max
            # add extra credit for every ten comedy attendees
            volume_credits += (perf["audience"] / 5).floor if play["type"] == "comedy"

            # print line for this order
            result << "    #{play["name"]}: #{format_amount(this_amount / 100)} (#{perf["audience"]} seats)\n"
            total_amount += this_amount
          end

          result << "Amount owed is #{format_amount(total_amount / 100)}\n"
          result << "You earned #{volume_credits} credits\n"
          result
        end


        private

        attr_reader :invoice, :plays

        def format_amount(num)
          format("$%.2f", num)
        end


        def amount_for(a_performance, play)
          result = 0

          case play["type"]
          when "tragedy"
            result = 40_000
            result += 1000 * (a_performance["audience"] - 30) if a_performance["audience"] > 30
          when "comedy"
            result = 30_000
            result += 10_000 + 500 * (a_performance["audience"] - 20) if a_performance["audience"] > 20
            result += 300 * a_performance["audience"]
          else
            raise "unknown type: #{play["type"]}"
          end

          result
        end



      end
    end
  end
end