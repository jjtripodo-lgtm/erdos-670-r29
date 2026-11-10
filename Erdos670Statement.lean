module

public import Mathlib.Analysis.InnerProductSpace.EuclideanDist
public import Mathlib.Data.Sym.Card

/-!
Solution-side copy of the single definition used by the Challenge statements.
It is identical to `Challenge.lean` and to Formal Conjectures commit
2f91d251c07fbbaf9435166d47c11e884a08a6cf.
-/

@[expose] public section

namespace Erdos670

/-- A finite set `A` of points has *separated distances* if for any two different
unordered pairs `{a, b} ≠ {c, e}` of distinct points of `A`, the distances differ
by at least one: `1 ≤ |dist a b - dist c e|`. -/
def HasSeparatedDistances {X : Type*} [MetricSpace X] (A : Finset X) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, ∀ e ∈ A, a ≠ b → c ≠ e → s(a, b) ≠ s(c, e) →
    1 ≤ |dist a b - dist c e|

end Erdos670
