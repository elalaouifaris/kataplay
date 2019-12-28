#include <stdio.h>
#include <criterion/criterion.h>

int remove_duplicates(int x) {
	return x;
}

Test(basic, identity) {
	cr_assert(remove_duplicates(1) == 1);
}
