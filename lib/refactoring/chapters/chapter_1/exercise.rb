# frozen_string_literal: true

module Refactoring
  module Chapters
    module Chapter1
      class Exercise < Chapters::Exercise
        def call
          implementation.call
        end
      end
    end
  end
end
