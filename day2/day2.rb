# frozen_string_literal: true

class Game
  attr_accessor :rounds

  def initialize(rounds:)
    @rounds = rounds
  end

  def validate
    rounds.inject(true) do |memo, element|
      memo && element.validate
    end
  end

  def power
    maxes = {red: 0, green: 0, blue: 0}
    rounds.each do |round|
      maxes[:red] = round.red if round.red > maxes[:red]
      maxes[:green] = round.green if round.green > maxes[:green]
      maxes[:blue] = round.blue if round.blue > maxes[:blue]
    end
    maxes[:red] * maxes[:green] * maxes[:blue]
  end

  def to_string
    result = rounds[0].to_string
    rounds[1..].each do |element|
      result += "; #{element.to_string}"
    end
    result
  end

  def self.from_string(line:)
    rounds = []
    line = line[(line.index(':') + 1)..]
    line.strip.split(';').each do |round_line|
      rounds << Round.from_string(line: round_line)
    end
    Game.new(rounds: rounds)
  end
end

class Round
  attr_accessor :red, :green, :blue

  def initialize(red:, green:, blue:)
    @red = red
    @green = green
    @blue = blue
  end

  def validate
    red < 13 && green < 14 && blue < 15
  end

  def to_string
    "red: #{red}, green: #{green}, blue: #{blue}"
  end

  def self.from_string(line:)
    red = 0
    green = 0
    blue = 0

    pulls = line.downcase.split(',')
    pulls.each do |pull|
      pull.strip!
      if (pull.include?('red'))
        red += pull.split(' ')[0].to_i
      elsif (pull.include?('green'))
        green += pull.split(' ')[0].to_i
      elsif (pull.include?('blue'))
        blue  += pull.split(' ')[0].to_i
      end
    end
    Round.new(red: red, green: green, blue: blue)
  end
end

sum = 0
File.open('day2/real_input').each do |line|
  id = line[(line.index(' ') + 1)...line.index(':')]
  sum += id.to_i if Game.from_string(line: line).validate
end
puts sum

sum = 0
File.open('day2/real_input').each do |line|
  sum += Game.from_string(line: line).power
end
puts sum