function transpose!(A::Matrix)
    n=size(A)[1]
    for i in 1:n
        for j in i:n
            k=A[i,j]
            A[i,j]=A[j,i]
            A[j,i]=k
        end
    end
    return A  
end