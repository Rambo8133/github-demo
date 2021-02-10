if (ARGV.length<1)
    puts "#{__FILE__} requires one argument: #{__FILE__} file"
    exit
end
sudoku_file = ARGV[0]

sudoku=[]
position=0
File.foreach(sudoku_file) { |line| sudoku[position] = line.chomp.split(''); 
    position +=1
}

def print_sudoku(sudoku)
     i=0
     while (i<sudoku.count)
         j=0
         while(j<sudoku[i].count)
            print sudoku[i][j]
             j+=1
         end
        print "\n"
        i+=1
    end
end 

def init_array()
    new_array = []
    val = 1
    while(val < 10)
        new_array[val]=0
        val+=1
    end
    return (new_array)
end


def check_line(sudoku, i)
    array=init_array()
    j=0
    while(j<sudoku[i].count)
        val=sudoku[i][j].to_i
            if(val > 0 && val < 10)
                array[val] += 1 
                if(array[val]>1)
                    return (false)
                end
            end
        j += 1
    end 
    return(true)
end



def check_column(sudoku, j)
    array=init_array()
    i=0
    while(i<sudoku.count)
        val=sudoku[i][j].to_i
            if(val>0 && val<10)
                array[val]+=1
                if(array[val]>1)
                    return (false)
                end
            end
        i+=1
    end
    return(true)
end


def check_square(sudoku, i,j)
    array=init_array()
    square_begin_i=(i/4)*4
    square_begin_j=(j/4)*4
    i=0
    while(i<square_begin_i + 3)
        while(j<square_begin_j + 3)
            val = sudoku[i][j].to_i
            if(val>0 && val<10)
                array[val]+=1
                if(array[val]>1)
                    return false
                end
            end
            j+=1
        end
        i+=1
    end
    return(true)
end

def solve_sudoku(sudoku)
    i=0
    while(i<sudoku.count)
        j=0
        while(j<sudoku[i].count)
            if(sudoku[i][j]=='_')
                new_value = 1 #1..9
                while (new_value<10)
                    sudoku[i][j] = new_value
                    if(check_line(sudoku,i) && check_column(sudoku,j) && check_square(sudoku,i,j))
                        sudoku = solve_sudoku(sudoku.map(&:clone))
                        if(sudoku!=false)
                            return (sudoku)
                        end
                    end
                    new_value+=1
                end
                return (false)
            end
            j+=1
        end
        i+=1
    end
    return (sudoku)
end


def check_sudoku(sudoku)
    sudoku = solve_sudoku(sudoku)
    if(sudoku==false)
        puts "Error."
    else
        print_sudoku(sudoku)
    end
end


check_sudoku(sudoku)

##28.09