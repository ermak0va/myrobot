newton(ff::Tuple{Function,Function}, x; ε_x=1e-8, ε_y=1e-8, nmaxiter=20) = newton((x->ff[1](x)/ff[2](x)), x; ε_x, ε_y, nmaxiter)
