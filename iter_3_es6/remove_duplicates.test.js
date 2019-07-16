import remove_duplicates from './remove_duplicates';

test('remove duplicates on empty list returns empty list', () => {
	expect(remove_duplicates([])).toStrictEqual([])
});

test('remove duplicates on a list with no duplicates returns the list unchanged', () => {
	expect(remove_duplicates([1, 2, 3])).toStrictEqual([1, 2, 3]);
});

test('Remove duplicates on a list withduplicats returns elements in appearance order', () => {
	expect(remove_duplicates(["a", 4, "a", 4, 4, "b"])).toStrictEqual(["a", 4, "b"]);
});

