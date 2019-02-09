from remove_duplicates import remove_duplicates

def test_remove_duplicates_from_empty_list_returns_empty_list():
  assert remove_duplicates([]) == []

def test_remove_duplicates_from_2_same_element_list_returns_1_element_list():
  assert remove_duplicates([1, 1]) == [1]

def test_remove_duplicates_from_no_duplicates_list_returns_same_list():
  assert remove_duplicates([1, 3, 5]) == [1, 3, 5]

def test_remove_duplicates_from__duplicates_list_returns_list_without_duplicates():
  assert remove_duplicates([1, 1, 5, 3, 5]) == [1, 5, 3]