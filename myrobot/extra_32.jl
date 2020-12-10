function in_or_out(r)
    side=bordered_side(r)
    next_side=nextside(side)
    while isborder(r,next_side)==false && isborder(r,side)==true
        move!(r,next_side)
    end
    text="Робот находится снаружи лабиринта"
    if isborder(r,side)==true
        text="Робот находится внутри лабиринта"
    end
    return text
end

function bordered_side(r)
    m=Nord
    for side in [Nord,Sud,Ost,West]
        if isborder(r,side)==true 
            m=side
        end
    end
    return m
end