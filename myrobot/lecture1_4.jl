
function special_color(r)
    x=count_side(r,West)
    y=count_side(r,Sud)
    i=0
    while isborder(r,Nord)==false
        paint(r,i)
        i=i+1
        move!(r,Nord)
    end
    paint(r,i)
    while isborder(r,Sud)==false
        move!(r,Sud)
    end
    go(r,Nord,y)
    go(r,Ost,x)
end

function go(r::Robot,side::HorizonSide,n)
    while n>0
        move!(r,side)
        n=n-1
    end
end
function paint(r,n)
    while isborder(r,Ost)==false
        move!(r,Ost)
    end
    while isborder(r,West)==false
        if n<=0
            putmarker!(r)
        end
        move!(r,West)
        n=n-1
    end
    putmarker!(r)
end
function count_side(r::Robot,side::HorizonSide)
    n=0
    while isborder(r,side)==false
        move!(r,side)
        n=n+1
    end 
    return n
end
