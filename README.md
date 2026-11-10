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

## Relation to the problem and to the literature

**The question.** Erdős asked whether every n-point set in R^d whose pairwise distances differ by at least one must have diameter at least (1 + o(1)) n² [Er97f]. For n ≥ 3, any such set has diameter at least C(n, 2) ≈ n²/2. Erdős proved the bound for d = 1. The source does not fix the quantifiers. Formal Conjectures, following the remarks on erdosproblems.com, reads it with d fixed and the o(1) term allowed to depend on d. This package negates exactly that reading, statement and definition copied verbatim from Formal Conjectures commit 2f91d25.

**Why d = 29 answers it.** The fixed-dimension statement says: for every d ≥ 1 and every ε > 0, all sufficiently large separated n-point sets in R^d have diameter at least (1 − ε)n². Infinitely many counterexamples in one dimension, R^29, with diameter below (499/500)n², contradict it with d = 29 and ε = 1/1000. Because R^29 embeds isometrically in R^d, the claim also fails for every d ≥ 29.

**Prior work.**
- B. S. Ho, *Erdős's diameter conjecture for separated distances fails in high dimensions*, [arXiv:2604.15305](https://arxiv.org/abs/2604.15305) (2026; the current arXiv title refers to a "dimension-free variant"). Ho takes n points in dimension n² − n, with diameter (1 − 1/π² + o(1))n². The dimension grows with n, so this does not decide the fixed-dimension question. Ho's Remark 9 states that the fixed-dimension question is open.
- J. Tripodo, *Separated distances in fixed dimension*, [hexagon:2610.00254v2](https://hexagonmath.org/2610.00254v2). This is the written source of the dimension-29 theorem formalized here. An earlier version, hexagon:2610.00254v1, gave a fixed-dimension construction in R^81,794.

**Novelty.** We know of no fixed-dimension counterexample by other authors. Novelty and priority have not been independently established beyond our own literature search.

**Gaps and limitations.**
- The cases 2 ≤ d ≤ 28, including the plane, are **not** settled.
- The theorem gives infinitely many n, not all sufficiently large n. A written all-n corollary in the source paper is not formalized here. The paper's "epsilon family", with diameter below (1/2 + ε)n² in a dimension depending on ε, is not formalized here.
- No optimality or smallest-dimension claim is made.
- Permitted axioms: `propext`, `Quot.sound`, `Classical.choice`.

**What is original and what is reused.**
- The construction, the proof and the formalization are original to this project.
- The proposition `Erdos670.erdos_670` and the definition `HasSeparatedDistances` are copied verbatim from Formal Conjectures (Apache License 2.0); the theorem names follow its conventions.
- 26 supporting modules are byte-identical to modules of the author's earlier Palomar entry.

**Earlier formalizations.**
- [PALOMAR-2026-10-14-000003](https://palomar-registry.org/entry.html?id=PALOMAR-2026-10-14-000003), same author: a different theorem, every n ≥ 68000 in R^458999 with diameter < (37/50)n².
- The author's public repository [erdos-670-fixed-dimension](https://github.com/jjtripodo-lgtm/erdos-670-fixed-dimension) contains an earlier, unregistered Lean negation of the same Formal Conjectures statement in R^81,794.
- Ho's Lean formalization of the growing-dimension result: [boonsuan/erdos670](https://github.com/boonsuan/erdos670).

[Er97f] P. Erdős, *Some unsolved problems*, Combinatorics, geometry and probability (Cambridge, 1993), 1997, 1–10.

## Provenance

- Paper: J. Tripodo, *Separated distances in fixed dimension*, [hexagon:2610.00254v2](https://hexagonmath.org/2610.00254v2). This package formalizes its dimension-29 theorem in the unbounded-subsequence form above. The paper's written all-n corollary is not formalized here.
- 26 supporting modules are byte-identical to modules of an earlier registered package by the same author, [PALOMAR-2026-10-14-000003](https://palomar-registry.org/entry.html?id=PALOMAR-2026-10-14-000003), which formalizes a different theorem (every n ≥ 68000 in R^458999, diameter < (37/50) n²).
- AI use: the construction, the proof and this formalization were developed with AI assistance (ChatGPT/Codex and Claude), directed by John Tripodo. No independent human mathematical review has taken place. John Tripodo is the responsible maintainer for reported issues and corrections.

## Licence

MIT. See `LICENSE`.
