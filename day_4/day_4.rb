#!/usr/bin/env ruby


def part_one(assignments)
  assignments
    .map { |assignment| assignment.split(',') }
    .map { |a, b| [assignment_range(a), assignment_range(b)] }
    .filter do |a, b|
        if a.size <= b.size
          shorter = a
          longer = b
        else
          shorter = b
          longer = a
        end
        shorter.size == longer.intersection(shorter).size
    end
    .size
end

def part_two(assignments)
  assignments
    .map { |assignment| assignment.split(',') }
    .map { |a, b| [assignment_range(a), assignment_range(b)] }
    .filter { |a, b| a.intersection(b).size != 0 }
    .size
end

def assignment_range(assignment)
  start_id, end_id = assignment.split('-').map(&:to_i)
  (start_id..end_id).to_a
end

def main
  input_path = ARGV[0]
  assignments = File.readlines(input_path).map(&:chomp)

  part_one_ans = part_one(assignments)
  puts "Part 1: #{part_one_ans}"

  part_two_ans = part_two(assignments)
  puts "Part 2: #{part_two_ans}"
end

main
