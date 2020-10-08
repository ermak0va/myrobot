function mark(r)
    num_steps=[]
    while isborder(r,Sud)==false || isborder(r,West)==false
        push!(num_steps,moves!(r,West))
        push!(num_steps,moves!(r,Sud))
    end
    k=length(num_steps)
    xx=0
    yy=0
    if isodd(k)
        for iii in 1:k
            if isodd(iii)
                xx=xx+num_steps[iii]
            else
                yy=yy+num_steps[iii]
            end
        end
    end
    if isodd(k+1)
        for iii in 1:k
            if isodd(iii)
                yy=yy+num_steps[iii]
            else
                xx=xx+num_steps[iii]
            end
        end
    end
    
    go_to(r,Nord)
    ny=go_to(r,Sud)
    go_to(r,Ost)
    nx=go_to(r,West)
    while_go(r,yy,Nord)
    moves!(r,Nord)
    while_go(r,xx,Ost)
    moves!(r,Ost)
    while_go(r,ny-yy-1,Sud)
    moves!(r,Sud)
    while_go(r,nx-xx-1,West)
    moves!(r,West)

    i=1
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

function go_to(r,side)
    i=1
    while isborder(r,side)==false
        i=i+1
        move!(r,side)
    end
    return i
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
function while_go(r,hh,side)
    while hh>0 
        hh=hh-1
        move!(r,side)
    end
    putmarker!(r)
end
