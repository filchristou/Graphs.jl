using BenchmarkTools
using Graphs

const DIGRAPHS = Dict{String,DiGraph}(
    "complete100" => complete_digraph(100), "path500" => path_digraph(500)
)

const GRAPHS = Dict{String,Graph}(
    "complete100" => complete_graph(100),
    "tutte" => smallgraph(:tutte),
    "path500" => path_graph(500),
)

const serialbenchmarks = [
    "serial/core.jl",
    # "serial/connectivity.jl",
    # "serial/centrality.jl",
    # "serial/edges.jl",
    # "serial/insertions.jl",
    # "serial/traversals.jl",
]

const SUITE = BenchmarkGroup()

foreach(serialbenchmarks) do bm
    include(bm)
end

const parallelbenchmarks = [
    "parallel/egonets.jl",
]

nothing
