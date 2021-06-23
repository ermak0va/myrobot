newton(polinom_coeff::Vector{Number}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)=
    newton(x->(y=evaldiffpoly(x, polynom_coeff); y[1]/y[2]), x; ε_x, ε_y, nmaxiter)

function evaldiffpoly(x,polynom_coeff)
    Q′=0
    Q=0
    for a in polinom_coeff
        Q′=Q′x+Q
        Q=Q*x+a
    end
    return Q, Q′
end