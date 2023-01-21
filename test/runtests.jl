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