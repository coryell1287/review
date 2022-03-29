const caller = (f) => {
	const x = 3;

	return f(5)(x);
}

const d = caller((w) => {
	const x = 4;
	
	return (y) => {
		return x * y + w;
	};
});
x= 4
y = 3
w= 5
caller(5)

//write how this works in the stack><L"k[o'
+
9*6*