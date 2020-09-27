function find_passage(r)
    side=Ost
    while isborder(r,Nord)==true
        putmarker!(r)
        move_marker(r,side)
        side=inverse(side)
    end
end

function move_marker(r,side)
    while ismarker(r)==true
        move!(r,side)
    end
end
function inverse(side)
    return HorizonSide(mod(Int(side)+2,4))
end