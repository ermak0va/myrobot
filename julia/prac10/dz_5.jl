newton(ff, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20)= newton(x->(y=ff(x); y[1]/y[2]), x; ε_x, ε_y, nmaxiter)
