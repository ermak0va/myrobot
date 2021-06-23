function cosins(x,v)
    xsq=x^2
    a=1
    k=1
    s=typeof(x)(0)
    while abs(a)>v
        s+=a
        a=-a*xsq/(2k)/(2k-1)
        k+=1
    end
    return s
end