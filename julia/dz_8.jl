insertsort!(A)=reduce(1:length(A))do _, k # в данном случае при выполнении операции вставки первый аргумент фуктически не используется
    while k>1 && A[k-1] > A[k]
    A[k-1], A[k] = A[k], A[k-1]
    k-=1
    end
    return A
end