from remove_duplicates import remove_duplicates

def test_remove_duplicates_from_empty_list_returns_empty_list():
  assert remove_duplicates([]) == []

def test_remove_duplicates_from_1_element_list_return_same_list():
  assert remove_duplicates([1]) == [1]

def test_remove_duplicates_from_2_same_element_list_returns_1_element_list():
  assert remove_duplicates([1, 1]) == [1]