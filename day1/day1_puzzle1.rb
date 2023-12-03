# frozen_string_literal: true

# Day 1 Puzzle 1
class Day1Puzzle1
  def parse_line(line:)
    line = line.downcase
    number_translation = { 'zero' => '0', 'one' => '1',
                           'two' => '2', 'three' => '3',
                           'four' => '4', 'five' => '5',
                           'six' => '6', 'seven' => '7',
                           'eight' => '8', 'nine' => '9' }

    decimal_digits = %w[0 1 2 3 4 5 6 7 8 9 zero one two three four five six seven eight nine]

    first_digit = decimal_digits.map { |element| [element, line.index(element)] }
                                .filter { |element| !element[1].nil? }
                                .min { |a, b| a[1] <=> b[1] }[0]

    first_digit = number_translation[first_digit] unless number_translation[first_digit].nil?

    last_digit = decimal_digits.map { |element| [element, line.rindex(element)] }
                               .filter { |element| !element[1].nil? }
                               .max { |a, b| a[1] <=> b[1] }[0]

    last_digit = number_translation[last_digit] unless number_translation[last_digit].nil?

    first_digit + last_digit
  end
end

process = Day1Puzzle1.new

# result = 0
# test_number = 1
# File.open('day1/example_input1').each do |line|
#   temp = process.parse_line(line: line.strip).to_i
#   puts "#{test_number}: #{temp}"
#   result += temp
#   test_number += 1
# end
# puts result

result = 0
test_number = 1
File.open('day1/real_input').each do |line|
  temp = process.parse_line(line: line.strip).to_i
  puts "#{test_number}: #{temp}"
  result += temp
  test_number += 1
end
puts result
