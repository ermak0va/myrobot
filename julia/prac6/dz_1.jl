function merge1(a,b)
    c=promote_type(eltype(a),eltype(b))[]
    for x in a
        append!(c,x)
    end
    for x in b
        append!(c,x)
    end
    return c
end

function merge2(a,b)
    c=Vector{promote_type(eltype(a),eltype(b))}(undef,length(a)+length(b))
    for i in 1:length(a)+length(b)
        if i<=length(a)
            c[i]=a[i]
        else
            c[i]=b[i-length(a)]
        end
    end
    return c
end

function merge!(a,b,c)
    for i in 1:length(a)+length(b)
        if i<=length(a)
            c[i]=a[i]
        else
            c[i]=b[i-length(a)]
        end
    end
    return c
end
