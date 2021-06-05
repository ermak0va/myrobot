function log(a::T,x::T,ε::T) where T<:AbstractFloat
    z, t, y = T(x), T(1), T(0)
    while z > a || z < 1/a || t > ε   
        if z > a
            z = z / a
            y = y + t 
        elseif z < 1/a
            z = z *  a
            y = y - t 
        else 
            t = t / 2
            z = z * z 
        end
    end
    return y
end