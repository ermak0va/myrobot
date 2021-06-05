function isprime(n)::Bool
    if n==1
        return false
    else
        for i in 2:sqrt(n) 
            if (mod(n,i) == 0) 
                return false
            end
        end
    end
    return true
end