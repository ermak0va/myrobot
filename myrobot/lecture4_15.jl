function mark_perimetr(r)
    num_steps=[]
    while isborder(r,Sud)==false || isborder(r,West)==false
        push!(num_steps,moves!(r,West))
        push!(num_steps,moves!(r,Sud))
    end
    for side in (Nord, Ost, Sud, West)
        while isborder(r,side)==false
            putmarker!(r)
            move!(r,side)
        end
    end
    i=1
    k=length(num_steps)
    if isodd(k)
        i=2
    end
    for n in 1:k
        i=i+1
        t=isodd(i)
        side=Nord
        if t
            side=Ost
        end
        moved!(r,side,num_steps[k-n+1])
    end 
end

function moves!(r,side)
    num_step=0
    while isborder(r,side)==false
        move!(r,side)
        num_step=num_step+1

    end
    
    return num_step
end
function moved!(r,side,num)
    while num>0
        num=num-1
        move!(r,side)
    end
end