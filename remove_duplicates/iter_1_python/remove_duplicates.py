def remove_duplicates(duplicates_list):
  no_duplicates = []
  [no_duplicates.append(element) for element in duplicates_list
    if element not in no_duplicates]
  return no_duplicates