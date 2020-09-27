function color_all(r::Robot)
    y=count_side(r,Sud)
    x=count_side(r,West)
    go_conor(r)
    start_coloring(r,Sud)
    if isborder(r,Sud)
        paint_line(r,Nord)
    end
    paint_line(r,Sud)
    go(r,Nord,y)
    go(r,Ost,x)
end

function go(r::Robot,side::HorizonSide,n)
    while n>0
        move!(r,side)
        n=n-1
    end
end
function start_coloring(r,side)
    
    while isborder(r,West)==false
        paint_line(r,side)
        side=opposite(side)
        move!(r,West)
    end
end
function paint_line(r,side)
    while isborder(r,side)==false
        putmarker!(r)    
        move!(r,side)
    end
    putmarker!(r)
end
function opposite(side)
    return HorizonSide(mod(Int(side)+2,4))
end
function go_conor(r)
    while isborder(r,Nord)==false
        move!(r,Nord)
    end
    while isborder(r,Ost)==false
        move!(r,Ost)
    end
end
function count_side(r::Robot,side::HorizonSide)
    n=0
    while isborder(r,side)==false
        move!(r,side)
        n=n+1
    end 
    return n
end
