(************************************************************************)
(*         *      The Rocq Prover / The Rocq Development Team           *)
(*  v      *         Copyright INRIA, CNRS and contributors             *)
(* <O___,, * (see version control and CREDITS file for authors & dates) *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

(* The type of positivstellensatz -- used to communicate with sos *)
type vname = string

open NumCompat

type term =
  | Zero
  | Const of Q.t
  | Var of vname
  | Opp of term
  | Add of (term * term)
  | Sub of (term * term)
  | Mul of (term * term)
  | Pow of (term * int)

let rec output_term o t =
  match t with
  | Zero -> output_string o "0"
  | Const n -> output_string o (Q.to_string n)
  | Var n -> Printf.fprintf o "v%s" n
  | Opp t -> Printf.fprintf o "- (%a)" output_term t
  | Add (t1, t2) -> Printf.fprintf o "(%a)+(%a)" output_term t1 output_term t2
  | Sub (t1, t2) -> Printf.fprintf o "(%a)-(%a)" output_term t1 output_term t2
  | Mul (t1, t2) -> Printf.fprintf o "(%a)*(%a)" output_term t1 output_term t2
  | Pow (t1, i) -> Printf.fprintf o "(%a)^(%i)" output_term t1 i

(* ------------------------------------------------------------------------- *)
(* Data structure for Positivstellensatz refutations.                        *)
(* ------------------------------------------------------------------------- *)

type positivstellensatz =
  | Axiom_eq of int
  | Axiom_le of int
  | Axiom_lt of int
  | Rational_eq of Q.t
  | Rational_le of Q.t
  | Rational_lt of Q.t
  | Square of term
  | Monoid of int list
  | Eqmul of term * positivstellensatz
  | Sum of positivstellensatz * positivstellensatz
  | Product of positivstellensatz * positivstellensatz

let rec output_psatz o = function
  | Axiom_eq i -> Printf.fprintf o "Aeq(%i)" i
  | Axiom_le i -> Printf.fprintf o "Ale(%i)" i
  | Axiom_lt i -> Printf.fprintf o "Alt(%i)" i
  | Rational_eq n -> Printf.fprintf o "eq(%s)" (Q.to_string n)
  | Rational_le n -> Printf.fprintf o "le(%s)" (Q.to_string n)
  | Rational_lt n -> Printf.fprintf o "lt(%s)" (Q.to_string n)
  | Square t -> Printf.fprintf o "(%a)^2" output_term t
  | Monoid l -> Printf.fprintf o "monoid"
  | Eqmul (t, ps) -> Printf.fprintf o "%a * %a" output_term t output_psatz ps
  | Sum (t1, t2) -> Printf.fprintf o "%a + %a" output_psatz t1 output_psatz t2
  | Product (t1, t2) ->
    Printf.fprintf o "%a * %a" output_psatz t1 output_psatz t2
