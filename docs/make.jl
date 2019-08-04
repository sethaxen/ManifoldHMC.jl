using Documenter, ManifoldHMC

makedocs(
    modules = [ManifoldHMC],
    format = :html,
    checkdocs = :exports,
    sitename = "ManifoldHMC.jl",
    pages = Any["index.md"]
)

deploydocs(
    repo = "github.com/sdaxen/ManifoldHMC.jl.git",
)
