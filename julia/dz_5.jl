function sortkey!(a,key)
    ind=bubblesortperm!(key)
    return a[ind]
end

function sortkey!(a,f)
    b=typeof(a)
    b=for i in firstindex(a):lastindex(a) b[i]=f(a[i]) end

end

