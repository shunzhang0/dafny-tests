method MatMulForwardNaive(
    inp: array<real>,
    weight: array<real>,
    bias: array<real>,
    B: int, T: int, C: int, OC: int) returns (out: array<real>)
    requires 1 <= B && 1 <= T && 1 <= C && 1 <= OC
    requires inp.Length == B * T * C
    requires weight.Length == OC * C
    requires bias.Length == OC 
    ensures out.Length == B * T * OC
{
    out := new real[B * T * OC];

    for b := 0 to B - 1 {
        for t := 0 to T - 1 {
            var bt := b * T + t;
            for o := 0 to OC - 1 {
                var val := bias[o];
                for i := 0 to C - 1 {
                    val := val + inp[bt * C + i] * weight[o * C + i];
                }
                out[bt * OC + o] := val;
            }
        }
    }
}