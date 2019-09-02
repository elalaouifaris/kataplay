module Bowling
  tag_for = Dict(
    "bonus_separator" => "||",
    "frame_separator"=> "|",
    "null_roll" => "-"
  )

  function score(game)
    frame_list, bonus = _parse_frames(game)
    frame_scores = map(_score_single_frame, frame_list)
    score = reduce(+, frame_scores)
    score
  end

  function _parse_frames(game)
    game = replace(game, tag_for["null_roll"] => "0")
    frames, bonus = split(game, tag_for["bonus_separator"])
    frame_list = split(frames, tag_for["frame_separator"])

    frame_list, bonus
  end

  function _score_single_frame(frame)
      first_roll, second_roll = frame
      score = parse(Int, first_roll) + parse(Int, second_roll)
      score
  end
end