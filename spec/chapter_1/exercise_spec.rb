# frozen_string_literal: true

RSpec.describe Refactoring::Chapters::Chapter1::Exercise do
  let(:output) do
    <<~OUT
      Statement for BigCo
          Hamlet: $650.00 (55 seats)
          As You Like It: $580.00 (35 seats)
          Othello: $500.00 (40 seats)
      Amount owed is $1730.00
      You earned 47 credits
    OUT
  end

  describe "initial implementation" do
    subject { described_class.call(implementation: Refactoring::Chapters::Chapter1::Initial) }

    it { is_expected.to eq output }
  end
  describe "refactored implementation" do
    subject { described_class.call(implementation: Refactoring::Chapters::Chapter1::Refactored) }

    it { is_expected.to eq output }
  end
end
