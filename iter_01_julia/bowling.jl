module Bowling
  tag_for = Dict(
    "bonus_separator" => "||",
    "frame_separator"=> "|",
    "null_roll" => "-"
  )
  function score(game)
    game = replace(game, tag_for["null_roll"] => "0")
    frames, bonus = split(game, tag_for["bonus_separator"])
    frame_list = split(frames, tag_for["frame_separator"])

    score = 0
    for frame in frame_list
      first_roll, second_roll = frame
      score += parse(Int, first_roll) + parse(Int, second_roll)
    end

    score
  end
end