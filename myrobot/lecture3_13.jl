function crest(r)
    for i in (Nord,Sud)
        for j in (Ost,West)
            moved(r,i,j)
        end
    end
end

function moved(r,i,j)
    k=0
    while isborder(r,i)==false && isborder(r,j)==false
        putmarker!(r)
        move!(r,i)
        move!(r,j)
        k=k+1
    end
    putmarker!(r)
    i=inverse(i)
    j=inverse(j)
    while k>0 
        k=k-1
        move!(r,i)
        move!(r,j)
    end
end
function inverse(side)
    return HorizonSide(mod(Int(side)+2,4))
end