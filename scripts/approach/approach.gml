function approach(a, b, v) {
	if (b < a) {
		return max(b, a - v)
	}
	
	return min(a + v, b)
}