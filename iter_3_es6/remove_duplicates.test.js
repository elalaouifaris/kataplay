import remove_duplicates from './remove_duplicates';

test('remove duplicates on empty list returns empty list', () => {
	expect(remove_duplicates([])).toStrictEqual([])
});

