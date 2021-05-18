function permute_!(A, perm)
    n=length(A)
    for i in 1:n
        j=i
        if (i!=perm[i])
            f=0
            while (j!=n+1 && f==0)
                if(perm[j]!=i)
                    j+=1
                else
                    f=1
                end
            end
            if (j!=n+1)
                A[i],A[perm[i]]=A[perm[i]],A[i]
                perm[i],perm[j]=perm[j],perm[i]
            end
        end
    end
    return A
end