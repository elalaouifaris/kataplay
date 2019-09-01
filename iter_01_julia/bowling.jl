module Bowling
  function score(game)
    frames, bonus = split(game, "||")
    frame_list = split(frames, "|")

    score = 0
    for frame in frame_list
      first_roll, second_roll = frame
      score += parse(Int, first_roll) + parse(Int, second_roll)
    end

    score
  end
end