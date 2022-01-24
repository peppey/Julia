grid = [[3, 0, 6, 5, 0, 8, 4, 0, 0], 
        [5, 2, 0, 0, 0, 0, 0, 0, 0], 
        [0, 8, 7, 0, 0, 0, 0, 3, 1], 
        [0, 0, 3, 0, 1, 0, 0, 8, 0], 
        [9, 0, 0, 8, 6, 3, 0, 0, 5], 
        [0, 5, 0, 0, 9, 0, 6, 0, 0], 
        [1, 3, 0, 0, 0, 0, 2, 5, 0], 
        [0, 0, 0, 0, 0, 0, 0, 7, 4], 
        [0, 0, 5, 2, 0, 6, 3, 0, 0]]


function print_grid(array)
    for i = 1:9
        println(array[i])
    end
end


function find_empty_location(array, l)
    for row = 1:9
        for col = 1:9
            if array[row][col] == 0
                l[1] = row
                l[2] = col
                return true
            end
        end
    end
    return false
end


function used_in_row(array, row, num)
    for i = 1:9
        if array[row][i] == num
            return true
        end
    end
    return false
end

function used_in_col(array, col, num)
    for i = 1:9
        if array[i][col]== num
            return true
        end
    end
    return false
end

function used_in_box(array, row, col, num)
    for i = 1:3
        for j = 1:3
            if array[i + row][j + col] == num
                return true
            end
        end
    end
    return false
end


function check_location_is_safe(array, row, col, num)
    return (!used_in_row(array, row, num) && 
    !used_in_col(array, col, num) && 
    !used_in_box(array, (row-1) - (row-1) % 3, (col-1) - (col-1) % 3, num))
end


function solve_sudoku(array)
    # l keeps record of row and col in find_empty_location
    l = [1, 1]

    if !find_empty_location(array, l)
        return true
    end

    # Assigning list values to row and col that
    # we got from the above function
    row = l[1]
    col = l[2]

    # numbers from 1 to 9
    for num = 1:9
        if check_location_is_safe(array, row, col, num)
            array[row][col] = num

            if solve_sudoku(array)
                return true
            end

            array[row][col] = 0

        end
    end

    return false
end


if solve_sudoku(grid)
    print_grid(grid)
else
    println("No solution exists")
end


