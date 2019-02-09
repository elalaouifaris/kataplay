def remove_duplicates(duplicates_list):
  unique = []
  [unique.append(element) for element in duplicates_list
    if element not in unique]

  return unique
