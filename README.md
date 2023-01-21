"{}".format rules made string/path formatting easy in julia

Install

To install, type ] in a julia (>=1.5) REPL and then input
```julia pkg
pkg> add https://github.com/JuliaHybrid/EasyFormat.jl
```

Examples:
```julia
using EasyFormat

p = Path("/home")
p = p("le")("CODE")("{}.jl").format("Pathpy")("src/{}.jl").format("path") |> unwrap
@show p

p = Path("/home")("le/CODE/{}.jl/src/{}.jl").format("Pathpy", "path") |> unwrap
@show p

p = Path("/home/le/CODE/{}.jl/src/{}.jl").format("Pathpy", "path") |> unwrap
@show p

s = Str("here I am {} {}").format("haha", "hehe") * Str("!") |> unwrap
@show s
```