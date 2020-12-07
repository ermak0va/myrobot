function find(r)
    num_steps_max=1
    side=Nord
    while ismarker(r)==false
        for _ in 1:2
            mar(r,side,num_steps_max)
            side=nextside(side)
        end
        num_steps_max+=1
    end
end
function mar(r,side,num)
    for _ in 1:num
        if ismarker(r)
            return nothing
        end
        if isborder(r,side)==true
            go_around(r,side)
        else
            move!(r,side)
        end
    end
end


function go_around(r,side_where)
    side=nextside(side_where)
    k=0
    n=0
    while isborder(r,side_where)==true
        k=k+1
        n=k
        while isborder(r,side_where)==true && n>0
            n=n-1
            move!(r,side)
        end
        side=inverseside(side)
    end
    move!(r,side_where)
    k=k/2
    while k>0
        k=k-1
        move!(r,side)
    end
end
