#!/usr/bin/env ruby

input_file = ARGV[0]
elf_calorie_list = File.readlines(input_file).map(&:chomp)

def part_one(elf_calorie_list)
  max_total = 0
  current_total = 0
  elf_calorie_list.each do |calories|
    if calories.size == 0
      max_total = current_total if current_total > max_total
      current_total = 0
    else
      current_total += calories.to_i
    end
  end

  max_total
end

def part_two(elf_calorie_list)
  current_total = 0
  calorie_totals = []
  elf_calorie_list.each do |calories|
    if calories.size == 0
      calorie_totals << current_total
      current_total = 0
    else
      current_total += calories.to_i
    end
  end

  calorie_totals
      .sort!
      .reverse
      .slice(0, 3)
      .sum
end

puts "Part 1: #{part_one(elf_calorie_list)}"
puts "Part 2: #{part_two(elf_calorie_list)}"
