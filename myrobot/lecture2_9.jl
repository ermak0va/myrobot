function find(r)
    num_steps_max=1
    side=Nord
    while ismarker(r)==false
        for _ in 1:2
            mar(r,side,num_steps_max)
            side=next(side)
        end
        num_steps_max+=1
    end
end
function mar(r,side,num)
    for _ in 1:num
        if ismarker(r)
            return nothing
        end
        move!(r,side)
    end
end
function next(side)
    HorizonSide(mod(Int(side)+1,4))
end
