function Abs(x: real): real {
	if x >= 0.0 then x else -x
}

method Sqrt(x: real) returns (res: real)
	requires x >= 0.0
{
	var eps := 0.0000000001; // Precision threshold
	var maxIterations := 10000; // Safety net for loop termination
	var guess := if x >= 1.0 then x else 1.0; // Initial guess

	for i := 0 to maxIterations // Max number of iterations to ensure termination
	{
		// Check if we reached the precision requirement
		if Abs(guess * guess - x) <= eps {
			break;
		}
		// Update guess using Newton-Raphson method while protecting against division by zero
		guess := (guess + x / (if guess != 0.0 then guess else 1.0)) / 2.0;
	}
	
	res := guess;
}