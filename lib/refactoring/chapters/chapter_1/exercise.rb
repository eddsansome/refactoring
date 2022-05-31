# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class Exercise < Chapters::Exercise
        def call
          implementation.call(invoice: invoice, plays: plays)
        end

        private

        def invoice
          @invoice ||= JSON.parse(File.read("lib/refactoring/chapters/chapter_1/files/invoices.json"))
        end

        def plays
          @plays ||= JSON.parse(File.read("lib/refactoring/chapters/chapter_1/files/plays.json"))
        end
      end
    end
  end
end
