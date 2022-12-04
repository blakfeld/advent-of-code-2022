#!/usr/bin/env ruby

SCORES = [*('a'..'z'), *('A'..'Z')].map.with_index(1) { |char, i| [char, i] }.to_h

def part_one(rucksack_contents)
  rucksack_contents
    .map(&:chars)
    .map { |chars| chars.each_slice(chars.size / 2).to_a }
    .flat_map { |a, b| a.intersection(b) }
    .map { |c| SCORES[c] }
    .sum
end

def part_two(rucksack_contents)
  rucksack_contents
    .map(&:chars)
    .each_slice(3)
    .flat_map { |chunk| chunk.reduce(:&) }
    .map { |c| SCORES[c] }
    .sum
end


def main
  input_path = ARGV[0]
  rucksack_contents = File.readlines(input_path).map(&:chomp)

  part_one_ans = part_one(rucksack_contents)
  puts "Part 1: #{part_one_ans}"

  part_two_ans = part_two(rucksack_contents)
  puts "Part 2: #{part_two_ans}"
end

main
