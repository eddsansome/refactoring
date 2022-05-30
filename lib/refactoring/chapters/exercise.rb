module Refactoring
    module Chapters
    class Exercise
        def self.call(...)
            new(...).call
        end
        def call
            raise NotImplementedError
        end

        def initialize(implementation:)
            @implementation = implementation
        end

        private

        attr_reader :implementation
    end
end
end
