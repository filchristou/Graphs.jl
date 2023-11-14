using BenchmarkTools
using Graphs

DIGRAPHS = Dict{String,DiGraph}(
    "complete100" => complete_digraph(100), "path500" => path_digraph(500)
)

GRAPHS = Dict{String,Graph}(
    "complete100" => complete_graph(100),
    "tutte" => smallgraph(:tutte),
    "path500" => path_graph(500),
)

# to do const
serialbenchmarks = [
    "serial/core.jl",
    # "serial/connectivity.jl",
    # "serial/centrality.jl",
    # "serial/edges.jl",
    # "serial/insertions.jl",
    # "serial/traversals.jl",
]

# to do const 
SUITE = BenchmarkGroup()

foreach(serialbenchmarks) do bm
    include(bm)
end

# to do const
parallelbenchmarks = [
    "parallel/egonets.jl",
]

nothing
