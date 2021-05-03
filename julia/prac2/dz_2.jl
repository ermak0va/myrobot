function sortkey(x,a)
    size=length(x)
    for i in 1:size
        for j in 1:size
            if x[i]>x[j]
                x[i],x[j]=x[j],x[i]
                a[i],a[j]=a[j],a[i]
            end
        end
    end
    return a
end

function sortkey(f::Function,a)
    sortkey(f.(a),a)
end