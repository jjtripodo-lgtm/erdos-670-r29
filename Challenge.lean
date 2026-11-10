module

public import Mathlib.Analysis.InnerProductSpace.EuclideanDist
public import Mathlib.Data.Sym.Card
public import Mathlib.Order.Filter.AtTopBot.Basic

/-!
# Separated distances in the fixed space R^29

A finite set of points has *separated distances* if the distances attached to
any two different unordered pairs of distinct points differ by at least one.
Erdős asked (Erdős Problem 670) whether such an n-point set in R^d must have
diameter at least (1 + o(1)) n^2.

This file states two results, named as in Formal Conjectures.

1. `Erdos670.erdos_670.variants.tripodo`: for infinitely many n there is an
   n-point set in the single fixed space R^29 with separated distances and
   diameter strictly below (499/500) n^2. No claim is made for every large n.
2. `Erdos670.erdos_670`: the negation of the fixed-dimension proposition as
   stated in Formal Conjectures (google-deepmind/formal-conjectures, file
   FormalConjectures/ErdosProblems/670.lean, commit
   2f91d251c07fbbaf9435166d47c11e884a08a6cf). The proposition and the
   definition `HasSeparatedDistances` are copied verbatim from that file. The
   variant gives the refutation with d = 29 and ε = 1/1000.

This file is the audited statement surface. Its deliberate proof holes are
matched by Comparator against proofs in `Solution`. It is not a proof.
-/

@[expose] public section

open Filter

namespace Erdos670

/-- A finite set `A` of points has *separated distances* if for any two different
unordered pairs `{a, b} ≠ {c, e}` of distinct points of `A`, the distances differ
by at least one: `1 ≤ |dist a b - dist c e|`. -/
def HasSeparatedDistances {X : Type*} [MetricSpace X] (A : Finset X) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, ∀ e ∈ A, a ≠ b → c ≠ e → s(a, b) ≠ s(c, e) →
    1 ≤ |dist a b - dist c e|

/-- For infinitely many `n` there is an `n`-point set in the fixed space `ℝ^29` with
separated distances and diameter below `(499/500) n^2`. -/
theorem erdos_670.variants.tripodo :
    ∃ᶠ n : ℕ in atTop, ∃ A : Finset (EuclideanSpace ℝ (Fin 29)), A.card = n ∧
      HasSeparatedDistances A ∧
      Metric.diam (A : Set (EuclideanSpace ℝ (Fin 29))) < (499 / 500 : ℝ) * (n : ℝ) ^ 2 := by
  sorry

/-- The fixed-dimension form of Erdős Problem 670, as stated in Formal Conjectures,
is false. -/
theorem erdos_670 :
    ¬ ∀ d : ℕ, 1 ≤ d → ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop,
      ∀ A : Finset (EuclideanSpace ℝ (Fin d)), A.card = n → HasSeparatedDistances A →
        (1 - ε) * (n : ℝ) ^ 2 ≤ Metric.diam (A : Set (EuclideanSpace ℝ (Fin d))) := by
  sorry

end Erdos670
