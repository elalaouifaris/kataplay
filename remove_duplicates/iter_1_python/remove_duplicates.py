def remove_duplicates(duplicates_list):
  unique_set = set(duplicates_list)
  sorting_function = duplicates_list.index
  return sorted(unique_set, key=sorting_function)
