module Duplicates

  function remove(elements)
    seen_elements = []
    for element in elements
      if !in(element, seen_elements)
	push!(seen_elements, element)
      end
    end
    seen_elements
  end

end
