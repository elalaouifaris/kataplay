#include <stdio.h>
#include <criterion/criterion.h>

void remove_duplicates(int *input, int *result, size_t input_size) {
	for (size_t current = 0, write = 0; current < input_size; ++current) {
		bool is_unique = true;

		for (size_t seen = 0; seen < current; ++seen) {
			if (input[current] == result[seen]) {
				is_unique = false;
			}
		}

		if (is_unique)  {
			result[write++] = input[current];
		}
	}

}

/*=================== TESTS SECTION ===================*/

void _check_equal_arrays(int *left, int *right, size_t input_size) {
	for (size_t i = 0; i < input_size; ++i) {
		cr_expect(left[i] == right[i]);
	}
}

Test(list_with_no_duplications, set_result_with_list_content) {
	int input[3] = {1, 2, 3};
	int result[3];

	remove_duplicates(input, result, 3);
	
	_check_equal_arrays(input, result, 3);
}

Test(list_with_duplications, set_result_with_first_encoutered_element) {
	int input[4] = {1, 2, 1, 3}; 
	int expected[3] = {1, 2, 3};
	int result[4];

	remove_duplicates(input, result, 4);
	
	_check_equal_arrays(expected, result, 3);
}

Test(empty_list, does_not_fail) {
	int input[0] = {}; 
	int expected[0] = {};
	int result[0];

	remove_duplicates(input, result, 0);
	
	_check_equal_arrays(expected, result, 0);
}
