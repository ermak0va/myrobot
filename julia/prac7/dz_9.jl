function gcd(m,n)
    a, b = m, n
    u_a, v_a = 1, 0
    u_b, v_b = 0, 1
    while b != 0
        k = a÷b
        a, b = b, a % b 
        u, v = u_a, v_a
        u_a, v_a = u_b, u_a
        u_b, v_b = u-k*u_b, v-k*v_b
    end
    d=u_a*m + v_a*n
    return d,u_a
end


function inv(a,M)
    d,u=gcd(a,M)
    if d!=1
        return nothing
    end
    if u<0
        return u+M
    end
    return u
end 