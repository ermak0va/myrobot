function insertsort!(A)
    n=length(A)
    for k in 2:n
        to_insert_1!(A,k)
    end
end

function to_insert_1!(A,k) 
    while k>1 && A[k-1] > A[k]
        A[k-1], A[k] = A[k], A[k-1]
        k = k - 1
    end
end


function quicsearch(iter,val) 
    
    first = 1
    last = length(iter)
    index = -1
    while first <= last && index == -1
        mid = div((first+last),2)
        if iter[mid] == val
            index = mid
        else
            if val<iter[mid]
                last = mid -1
            else
                first = mid +1
            end
        end
    end

    if index==-1
        pos=0
        for i in 1:length(iter) 
            if val<iter[i]
                pos=i
                break
            end
        end
        if pos==0
            pos=length(iter)
        end

        return false,pos 
    else
       return true, index
    end
end



