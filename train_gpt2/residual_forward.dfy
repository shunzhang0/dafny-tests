method ResidualForward(inp1: array<real>, inp2: array<real>, N: nat) returns (out: array<real>)
  requires inp1.Length == N
  requires inp2.Length == N
  ensures out.Length == N
  ensures forall i :: 0 <= i < N ==> out[i] == inp1[i] + inp2[i]
{
  out := new real[N];
  var i: nat := 0;
  while i < N
    invariant 0 <= i <= N
    invariant forall j :: 0 <= j < i ==> out[j] == inp1[j] + inp2[j]
  {
    out[i] := inp1[i] + inp2[i];
    i := i + 1;
  }
}
