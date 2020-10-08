function med_temp(r)
    t=0
    m=go_to(r,Nord)
    n=1
    side=Nord
    while isborder(r,Ost)==false 
        n=n+1
        side=HorizonSide(mod(Int(side)+2,4))
        t=t+find_column_temp(r,side)
        move!(r,Ost)
    end
    side=HorizonSide(mod(Int(side)+2,4))
    t=t+find_column_temp(r,side)
    print(t/(n*m))
end

function find_column_temp(r,side)
    n=0
    while isborder(r,side)==false
       n=n+temperature(r) 
       move!(r,side)
    end
    n=n+temperature(r)
    return n
end
function go_to(r,side)
    i=1
    while isborder(r,side)==false
        i=i+1
        move!(r,side)
    end
    return i
end