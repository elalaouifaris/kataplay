def remove_duplicates(duplicates_list):
  no_duplicates = []
  for element in duplicates_list:
    if element not in no_duplicates:
      no_duplicates.append(element)
  return no_duplicates