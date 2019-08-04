using Documenter, ManifoldHMC

makedocs(
    modules = [ManifoldHMC],
    format = Documenter.HTML(prettyurls = false),
    checkdocs = :exports,
    sitename = "ManifoldHMC",
    pages = [
        "Overview" => "index.md",
        "(Co)geodesic Flow" => "flow.md"
    ]
)

deploydocs(
    repo = "github.com/sdaxen/ManifoldHMC.jl.git",
)
