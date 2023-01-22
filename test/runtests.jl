using Pkg 
Pkg.activate(".")
using EasyFormat
using MonadInterface

p = Path("/home")
p = p("le")("CODE")("{}.jl").format("Pathpy")("src/{}.jl").format("path") |> unwrap
@show p

p = Path("/home")("le/CODE/{}.jl/src/{}.jl").format("Pathpy", "path") |> unwrap
@show p

p = Path("/home/le/CODE/{}.jl/src/{}.jl").format("Pathpy", "path") |> unwrap
@show p

s = Str("here I am {} {}").format("haha", "hehe") * Str("!") |> unwrap
@show s

MonadInterface.check_rules(x->x*"10", Path, "/home/here", Val(:fMa))
MonadInterface.check_rules(x->x*"10", Str, "/home/here", Val(:fMa))
println("successfully check fMa rule")

MonadInterface.check_rules(Path("/home/here"), Path, Val(:mM))
MonadInterface.check_rules(Str("/home/here"), Str, Val(:mM))
println("successfully check mM rule")

MonadInterface.check_rules(x->Path(format(x, "one")), x->Path(format(x, "two")), Path("/home/{}/{}"), Val(:fgm))
MonadInterface.check_rules(x->Str(format(x, "one")), x->Str(format(x, "two")), Str("/home/{}/{}"), Val(:fgm))
println("successfully check fgm rule")