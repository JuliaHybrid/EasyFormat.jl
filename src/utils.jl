using MonadInterface

struct Path 
    s::String
    format::Union{Function, Nothing}
end

struct Str 
    s::String 
    format::Function
    sformat::Function
end

import MonadInterface.unwrap
unwrap(ps::Union{Path, Str}) = ps.s

function format(ps::String, svec...) 
    s, nsvec = svec[1], svec[2:end]
    i = findfirst('{', ps)
    @assert ps[i+1]=='}'
    ps = ps[1:i-1] * s * ps[i+2:end]
    if length(nsvec) > 0
        return format(ps, nsvec...)
    end 
    return ps
end 

Path(s::String) = begin 
    #closure
    _format(svec...) = Path(format(s, svec...), nothing)
    return Path(s, _format)
end
import MonadInterface.fmap
fmap(f::Function, p::Path) = Path(f(p.s))

Str(s::String) = begin 
    #closure
    _format(svec...) = Str(format(s, svec...))
    sformat(svec...) = format(s, svec...)
    return Str(s, _format, sformat)
end
fmap(f::Function, p::Str) = Str(f(p.s))

join(p1::Path, p2::Path) = Path(joinpath(p1.s, p2.s))
(p::Path)(s::String) = join(p, Path(s))


import Base.(*)
(*)(s1::Str, s2::Str) = Str(s1.s * s2.s)