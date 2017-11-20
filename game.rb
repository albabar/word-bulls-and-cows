# frozen_string_literal: true

require_relative './engine'

class Game
  attr_reader :board
  def initialize
    @board = Engine.new
    print instructions
    puts "\n" * 2
  end

  def play
    bulls, cows = process_input

    if bulls == 4
      puts "Nice, I guessed it only in #{board.try_count} try! :D"
    elsif board.check(bulls, cows)
      play
    else
      puts "I don't have any other option. Did you make any mistake scoring me?"
    end
  end

  private

  def process_input
    puts guess_present
    print 'What is the score? (space separated bulls and cows): '
    gets.chomp.strip.split(' ').map(&:to_i)
  end

  def guess_present
    presenters = [
      'I think you thought __GUESS__.',
      'Is it __GUESS__?',
      'Maybe __GUESS__?',
      "It's probably __GUESS__",
      'Most likely __GUESS__'
    ]
    presenters.sample.sub('__GUESS__', board.current_guess.join.upcase)
  end

  def instructions
    <<~DOC
      ****************************************************
      Choose a 4 letters word (like LOVE) and I will guess!
      Words with duplicate letter (like BOOK) won't count.
      I will say my word and you give me my Bulls and Cows number.
      The number of Bulls - letters correct in the right position.
      The number of Cows - letters correct but in the wrong position.
      ****************************************************
    DOC
  end
end

trap('SIGINT') do
  puts "\nClosing the game..."
  exit 130
end

Game.new.play
