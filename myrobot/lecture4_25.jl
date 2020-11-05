function find_warm(r)
    coord_gor,temp_gor=count_temp_side(r,"g")
    coord_vert,temp_vert=count_temp_side(r,"v")
    text="Not gran"
    if temp_gor>temp_vert
        coord_max=coord_gor
        temp_max=temp_gor
    else
        coord_max=coord_vert
        temp_max=temp_vert
    end
    coord_gran,temp_gran=count_temp_gran(r)
    if temp_gran>temp_max
        coord_max=coord_gran
        text="gran"
    end
    return coord_max,text
end

function count_temp_gran(r)
    while isborder(r,Sud)==false||isborder(r,West)==false
        move_if_possible!(r,Sud) 
        move_if_possible!(r,West)
    end
    t_max=temperature(r)
    coord=(0,0)
    ny=0
    nx=0
    t=0
    while isborder(r,Nord)==false
        t=t+temperature(r)
        ny=ny+1
        move!(r,Nord)
    end
    t=t+temperature(r)
    ny=ny+1
    t_max=t/ny
    coord=(0,0)
    t=0
    while isborder(r,Ost)==false
        t=t+temperature(r)
        nx=nx+1
        move!(r,Ost)
    end
    t=t+temperature(r)
    t=t/nx
    nx=nx+1
    if t>t_max
        coord=(0,ny-1)
        t_max=t
    end
    t=0
    while isborder(r,Sud)==false
        t=t+temperature(r)
        move!(r,Sud)
    end
    t=t+temperature(r)
    t=t/ny
    if t>t_max
        coord=(nx-1,0)
        t_max=t
    end
    t=0
    while isborder(r,West)==false
        t=t+temperature(r)
        move!(r,West)
    end
    t=t+temperature(r)
    t=t/nx
    if t>t_max
        coord=(0,0)
        t_max=t
    end
    return coord,t_max
end
function count_temp_side(r,text)
    while isborder(r,Sud)==false||isborder(r,West)==false
        move_if_possible!(r,Sud) 
        move_if_possible!(r,West)
    end
    t_max=temperature(r)
    c=false
    if text=="g"
        side=Ost
        side_count=Nord
    end
    if text=="v"
        side=Nord
        side_count=Ost
    end
    coord=(0,0)
    while isborder(r,side_count)==false
        while move_if_possible!(r,side)==true
            if isborder(r,side_count)==true
                c=true
            end
            if isborder(r,side_count)==false
                if c==true
                    move!(r,side_count)
                    t=find_temp(r,inverseside(side),side_count)
                    if t>t_max
                        t_max=t
                        coord=find_coord_left_low(r)
                    end
                    move!(r,inverseside(side_count))
                    c=false
                end
            end
        end
        side=inverseside(side)
        move!(r,side_count)
    end
    return coord,t_max
end

function find_coord_left_low(r)
    coord=(0,0)
    if isborder(r,Ost)==true
        move!(r,Sud)
        coord=find_coord(r)
        move!(r,Nord)
    end
    if isborder(r,West)==true
        move!(r,Sud)
        move!(r,West)
        while isborder(r,Nord)==true
            move!(r,West)
        end
        coord=find_coord(r)
        move!(r,Ost)
        while isborder(r,Nord)==true
            move!(r,Ost)
        end
        move!(r,Nord)
    end
    if isborder(r,Nord)==true
        move!(r,West)
        coord=find_coord(r)
        move!(r,Ost)
    end
    if isborder(r,Sud)==true
        move!(r,West)
        move!(r,Sud)
        while isborder(r,Ost)==true
            move!(r,Sud)
        end
        coord=find_coord(r)
        move!(r,Nord)
        while isborder(r,Ost)==true
            move!(r,Nord)
        end
        move!(r,Ost)
    end
    return coord
end
function find_coord(r)
    x=0
    y=0
    while isborder(r,Sud)==false||isborder(r,West)==false
        if move_if_possible!(r,Sud)==true
            y=y+1
        end
        if move_if_possible!(r,West)==true
            x=x+1
        end
    end
    x1=x
    y1=y
    while x1+y1>0
        if x1>0
            x1=x1-1
            move_if_possible!(r,Ost)
        end
        if y1>0
            y1=y1-1
            move_if_possible!(r,Nord)
        end
    end
    return x,y
end
function find_temp(r,xside,yside)
    x=0
    y=0
    t=0
    while isborder(r,xside)==true
        x=x+1
        t=t+temperature(r)
        move!(r,yside)
    end
    move!(r,xside)
    while isborder(r,inverseside(yside))==true
        y=y+1
        t=t+temperature(r)
        move!(r,xside)
    end
    move!(r,inverseside(yside))
    while isborder(r,inverseside(xside))==true
        t=t+temperature(r)
        move!(r,inverseside(yside))
    end
    move!(r,inverseside(xside))
    while isborder(r,yside)==true
        t=t+temperature(r)
        move!(r,inverseside(xside))
    end
    move!(r,yside)
    return t/(2x+2y)
end