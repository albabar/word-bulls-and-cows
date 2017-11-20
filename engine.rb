# frozen_string_literal: true
class Engine
  SIZE = 4
  attr_reader :guesses, :candidates

  def initialize
    @guesses = []
    @candidates = [*'a'..'z'].permutation(SIZE).to_a.shuffle
  end

  def check(bulls, cows)
    filter_candidates(bulls, cows)
    candidates.any? && guess
  end

  def current_guess
    guesses.last || guess
  end

  def guess
    @guesses << candidates.pop
  end

  def filter_candidates(bulls, cows)
    @candidates = candidates.select do |guess|
      current_bulls = guess.zip(current_guess).count { |g, cg| g == cg }
      current_cows = SIZE - (guess - current_guess).size - bulls
      current_bulls == bulls && current_cows && cows
    end
  end
end