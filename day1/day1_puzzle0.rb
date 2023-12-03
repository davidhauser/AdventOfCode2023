# frozen_string_literal: true

# Day 1 Puzzle 0
class Day1Puzzle0
  def parse_line(line:)
    decimal_digits = %w[0 1 2 3 4 5 6 7 8 9]
    first_digit = ''
    line.each_char do |char|
      if decimal_digits.include?(char)
        first_digit = char
        break
      end
    end

    last_digit = ''
    line.reverse.each_char do |char|
      if decimal_digits.include?(char)
        last_digit = char
        break
      end
    end
    first_digit + last_digit
  end
end

process = Day1Puzzle0.new

File.open('day1/example_input').each do |line|
  puts process.parse_line(line: line.strip)
end

result = 0
File.open('day1/real_input').each do |line|
  result += process.parse_line(line: line.strip).to_i
end
puts result