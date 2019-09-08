module Bowling
  tag_for = Dict(
    "bonus_separator" => "||",
    "frame_separator"=> "|",
    "null_roll" => '-',
    "spare_roll" => '/',
    "strike_roll" => 'X'
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
    frame_bonus = (0, 0)

    for frame in frame_list
      score, frame_bonus = _update_score(frame, score, frame_bonus)
    end

    score
  end

  function _update_score(frame, score, previous_frame_bonus)
    first_roll, second_roll = first(frame), last(frame)
    previous_frame_points, next_frame_bonus = _get_previous_frame_points(first_roll, second_roll, previous_frame_bonus)
    current_frame_points, next_frame = _get_current_frame_points(first_roll, second_roll)

    score += previous_frame_points + current_frame_points
    next_frame = (first(next_frame) + first(next_frame_bonus)), (last(next_frame) + last(next_frame_bonus))
    score, next_frame
  end

  function _get_previous_frame_points(first_roll, second_roll, previous_frame_bonus)
    first_roll_points, second_roll_points, next_frame_bonus = _parse_frame_points(first_roll, second_roll, previous_frame_bonus)
    first_roll_bonus =  first(previous_frame_bonus) * first_roll_points
    second_roll_bonus = last(previous_frame_bonus) * second_roll_points
    score_update = first_roll_bonus + second_roll_bonus
    score_update, next_frame_bonus
  end

  function _get_current_frame_points(first_roll, second_roll)
    if first_roll == tag_for["strike_roll"]
      score_update = frame_full_score
      next_frame_bonus = (1, 1)
    elseif second_roll == tag_for["spare_roll"]
      score_update = frame_full_score
      next_frame_bonus = (1, 0)
    else
      score_update = parse(Int, first_roll) + parse(Int, second_roll)
      next_frame_bonus = (0, 0)
    end

    score_update, next_frame_bonus
  end

  function _parse_frame_points(first_roll, second_roll, previous_frame_bonus)
    if first_roll == tag_for["strike_roll"]
      first_roll = frame_full_score
      second_roll = 0
      next_frame_bonus = (last(previous_frame_bonus), 0)
    elseif second_roll == tag_for["spare_roll"]
      first_roll = parse(Int, first_roll)
      second_roll = frame_full_score - first_roll
      next_frame_bonus = (0, 0)
    else
      first_roll = parse(Int, first_roll)
      second_roll = parse(Int, second_roll)
      next_frame_bonus = (0, 0)
    end

    first_roll, second_roll, next_frame_bonus
  end
end