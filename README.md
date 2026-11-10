# Separated distances in the fixed space R^29

A Lean 4 formalization of a negative answer to the fixed-dimension form of Erdős Problem 670.

## Result

A finite set of points has *separated distances* if the distances attached to any two different unordered pairs of distinct points differ by at least one. Erdős asked whether every such n-point set in R^d must have diameter at least (1 + o(1)) n² ([erdosproblems.com/670](https://www.erdosproblems.com/670)).

`Challenge.lean` states two theorems. It imports only Mathlib:

- `Erdos670.erdos_670.variants.tripodo`: for infinitely many n there is an n-point set in R^29 with separated distances and diameter strictly below (499/500) n².
- `Erdos670.erdos_670`: the negation of the fixed-dimension proposition exactly as stated in [Formal Conjectures, commit 2f91d25](https://github.com/google-deepmind/formal-conjectures/blob/2f91d251c07fbbaf9435166d47c11e884a08a6cf/FormalConjectures/ErdosProblems/670.lean), with d = 29 and ε = 1/1000.

The sizes n form an unbounded set; there is no claim for every large n. No optimality or smallest-dimension claim is made.

## Verify

Requirements: elan. The toolchain is `leanprover/lean4:v4.35.0-rc2`; Mathlib is pinned in `lake-manifest.json`.

```sh
lake exe cache get
lake build Challenge Solution
lake comparator --config comparator.json          # needs bubblewrap
lake comparator --config comparator.json --paranoid   # also runs every bundled external kernel
```

`comparator.json` compares both theorems and permits only `propext`, `Quot.sound` and `Classical.choice`.

## Provenance

- Paper: J. Tripodo, *Separated distances in fixed dimension*, [hexagon:2610.00254v2](https://hexagonmath.org/2610.00254v2). This package formalizes its dimension-29 theorem in the unbounded-subsequence form above. The paper's written all-n corollary is not formalized here.
- 26 supporting modules are byte-identical to modules of an earlier registered package by the same author, [PALOMAR-2026-10-14-000003](https://palomar-registry.org/entry.html?id=PALOMAR-2026-10-14-000003), which formalizes a different theorem (every n ≥ 68000 in R^458999, diameter < (37/50) n²).
- AI use: the construction, the proof and this formalization were developed with AI assistance (ChatGPT/Codex and Claude), directed by John Tripodo. No independent human mathematical review has taken place. John Tripodo is the responsible maintainer for reported issues and corrections.

## Licence

MIT. See `LICENSE`.
