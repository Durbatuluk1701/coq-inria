From Stdlib Require Import ZArith Lia.

(* Submitted by Yegor Bryukhov (BZ#922) *)

Open Scope Z_scope.

Lemma Test46 :
forall v1 v2 v3 v4 v5 : Z,
((2 * v4) + (5)) + (8 * v2) <= ((4 * v4) + (3 * v4)) + (5 * v4) ->
9 * v4 > (1 * v4) + ((2 * v1) + (0 * v2)) ->
((9 * v3) + (2 * v5)) + (5 * v2) = 3 * v4 ->
0 > 6 * v1 ->
(0 * v3) + (6 * v2) <> 2 ->
(0 * v3) + (5 * v5) <> ((4 * v2) + (8 * v2)) + (2 * v5) ->
7 * v3 > 5 * v5 ->
0 * v4 >= ((5 * v1) + (4 * v1)) + ((6 * v5) + (3 * v5)) ->
7 * v2 = ((3 * v2) + (6 * v5)) + (7 * v2) ->
0 * v3 > 7 * v1 ->
9 * v2 < 9 * v5 ->
(2 * v3) + (8 * v1) <= 5 * v4 ->
5 * v2 = ((5 * v1) + (0 * v5)) + (1 * v2) ->
0 * v5 <= 9 * v2 ->
((7 * v1) + (1 * v3)) + ((2 * v3) + (1 * v3)) >= ((6 * v5) + (4)) + ((1) + (9))
-> False.
intros.
lia.
Qed.
