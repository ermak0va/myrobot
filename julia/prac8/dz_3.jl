function srav()
    array = []
    for i in 1:999999
        push!(array, rand())
    end
    array2 = array
    array3 = array
    @btime sort!(array)
    @btime mergesort!(array2)
    @btime mergesort1!(array3)
end