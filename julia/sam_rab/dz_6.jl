
"""
    calcsort_numzeros(a)

- calcsort_numzeros - сортирует столбцы матрицы по невозрастанию числа содержащихся в ней нуле
методом посчета их количества
"""
function calcsort_numzeros(a)
    b=[@view a[:,j] for j in 1:size(a,2)]
    k_s=[length(findall(b[j].== 0)) for j in 1:length(b)]
    b = calcsortkey(b, k_s, collect(0:size(a,1)))
    return hcat(b...)
end

"""
calcsortkey(a, key_series, key_values)

форимрует вектор из элементов вектора a в порядке неубывания их ключей из вектора key_sries 
"""
function calcsortkey(a, key_series, key_values)
    vector_vector_indexes = calcsortindexes(key_series, key_values)
    c=similar(a)
    j=1
    for vector_indexes in vector_vector_indexes  
        for i in vector_indexes
            c[j] = a[i]
            j+=1
        end
    end
    return c
end


"""
    calcsortindexes(key_series, key_values)

возвращает vector_vector_indexes
    пример: 
        key_values = [0,1,2,3]
        key_sries = [2,3,0,2,0]

        vector_vector_indexes = calcsortindexes(key_series, key_values)
    тогда
        vector_vector_indexes[1] = [3,5]
        vector_vector_indexes[2] = []
        vector_vector_indexes[3] = [1,4]
        vector_vector_indexes[4] = [2]
"""    
function calcsortindexes(key_series, key_values) 
    vector_vector_indexes=[Int[] for _ in key_values]
    for i in eachindex(key_series)
        k=indexvalue(key_series[i], key_values)
        push!(vector_vector_indexes[k], i)
    end
    return vector_vector_indexes
end

indexvalue(v, values::Vector) = findfirst(x->x==v, values)
