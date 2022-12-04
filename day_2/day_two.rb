#!/usr/bin/env ruby

MOVE_KEY = {
  A: :rock,
  X: :rock,
  B: :paper,
  Y: :paper,
  C: :scissors,
  Z: :scissors,
}

DESIRED_RESULT_KEY = {
  X: :lose,
  Y: :draw,
  Z: :win,
}

# Move -> Beats
WIN_KEY = {
  rock: :scissors,
  paper: :rock,
  scissors: :paper,
}
LOSS_KEY = WIN_KEY.invert

MOVE_POINTS = {
  rock: 1,
  paper: 2,
  scissors: 3,
}


def calc_score(opponent_move, player_move)
      match_points = MOVE_POINTS[player_move]
      match_points += 6 if opponent_move == WIN_KEY[player_move] 
      match_points += 3 if opponent_move == player_move

      match_points
end

def part_one(strat_guide_rows)
  decrypted_rows = strat_guide_rows
    .map { |a, b| [MOVE_KEY[a.to_sym], MOVE_KEY[b.to_sym]] }

  decrypted_rows
    .map do |opponent_move, player_move|
      calc_score(opponent_move, player_move)
    end
    .sum
end


def part_two(strat_guide_rows)
  decrypted_rows = strat_guide_rows
    .map { |a, b| [MOVE_KEY[a.to_sym], DESIRED_RESULT_KEY[b.to_sym]] }

  decrypted_rows
    .map do |opponent_move, desired_result|
      player_move = case desired_result
                    when :draw
                      opponent_move
                    when :lose
                      WIN_KEY[opponent_move]
                    when :win
                      LOSS_KEY[opponent_move]
                    end
      calc_score(opponent_move, player_move)
    end
    .sum
end


def main
  strat_guide_path = ARGV[0]
  strat_guide_rows = File.readlines(strat_guide_path)
    .map(&:chomp)
    .map(&:split)

  part_one_ans = part_one(strat_guide_rows)
  puts "PART 1: #{part_one_ans}"

  part_two_ans = part_two(strat_guide_rows)
  puts "PART 2: #{part_two_ans}"
end

main
