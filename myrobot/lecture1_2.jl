function paint_perimetr(r)
    y=count_side(r,Sud)
    x=count_side(r,West)
    go_paint(r,Ost)
    go_paint(r,Nord)
    go_paint(r,West)
    go_paint(r,Sud)
    go(r,Nord,y)
    go(r,Ost,x)
end

function count_side(r,side)
    n=0
    while isborder(r,side)==false
        move!(r,side)
        n=n+1
    end 
    return n
end
function go_paint(r,side)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
function go(r,side,n)
    while n>0
        move!(r,side)
        n=n-1
    end
end