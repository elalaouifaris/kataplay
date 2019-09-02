module Bowling
  tag_for = Dict(
    "bonus_separator" => "||",
    "frame_separator"=> "|",
    "null_roll" => '-',
    "spare_roll" => '/'
  )

  frame_full_score = 10

  function score(game)
    frame_list, bonus = _parse_frames(game)
    the_score = _score(frame_list, bonus)

    the_score
  end

  function _parse_frames(game)
    game = replace(game, tag_for["null_roll"] => "0")
    frames, bonus = split(game, tag_for["bonus_separator"])
    frame_list = split(frames, tag_for["frame_separator"])

    frame_list, bonus
  end

  function _score(frame_list, bonus)
    score = 0
    add_next_roll = 0

    for frame in frame_list
      score, add_next_roll = _update_score(frame, score, add_next_roll)
    end

    score
  end

  function _update_score(frame, score, add_next_roll)
      first_roll, second_roll = frame

      if add_next_roll != 0
        score += add_next_roll * parse(Int, first_roll)
        add_next_roll = 0
      end

      if second_roll == tag_for["spare_roll"]
        score += frame_full_score
        add_next_roll += 1
      else
        score += parse(Int, first_roll) + parse(Int, second_roll)
      end

    score, add_next_roll
  end
end