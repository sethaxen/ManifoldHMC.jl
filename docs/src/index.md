# [Introduction](@id Introduction)

_ManifoldHMC_ provides functionality for Hamiltonian Monte Carlo (HMC) on
manifolds. For an overview of HMC, we recommend reading
[[Betancourt, 2017](#Betancourt2017)]. For an introduction to HMC on manifolds,
we recommend reading [[Byrne and Girolami, 2013](#Byrne2013)].

This package provides a minimal feature set to join together two general-purpose
packages:

- [`DynamicHMC.jl`](https://github.com/tpapp/DynamicHMC.jl) implements the
  approach to "Dynamic HMC" described in [[Betancourt, 2017](#Betancourt2017)]
  and implemented in [Stan](https://mc-stan.org/).
- [`Manifolds.jl`](https://github.com/JuliaNLSolvers/Manifolds.jl) is an
  under-development package that provides a general framework for
  programming on manifolds.

The primary purpose of this package is to generalize existing implementations of
HMC, enabling the efficient dynamic HMC approach with automated tuning during a
warm-up period to be applied when sampling parameters that are not defined in a
Euclidean space but instead defined on such manifolds as the $n$-sphere, the
$n$-simplex, and the space of positive definite matrices.

## Literature

```@raw html
<ul>
  <li id="Betancourt2017">[<a>Betancourt, 2017</a>]
    M. Betancourt, “A Conceptual Introduction to Hamiltonian Monte Carlo,”
    <i>arXiv [stat]</i>, 2017.
    arXiv: <a href="https://arxiv.org/abs/1701.02434">1701.02434</a>.
  </li>
  <li id="Byrne2013">[<a>Byrne and Girolami, 2013</a>]
    S. Byrne and M. Girolami, “Geodesic Monte Carlo on Embedded Manifolds,”
    <i>Scandinavian Journal of Statistics</i>, vol. 40, no. 4, pp. 825–845,
    2013.
    doi: <a href="https://doi.org/10.1111/sjos.12036">10.1111/sjos.12036</a>.
    arXiv: <a href="https://arxiv.org/abs/1301.6064">1301.6064</a>.
  </li>
</ul>
```
