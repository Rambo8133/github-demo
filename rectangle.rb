if(ARGV.length < 2)
    puts "#{__FILE__} need you select an array in input!"
    exit
end

c1=ARGV[0]
c2=ARGV[1]

position1=0
position2=0
square_to_find=[]
data=[]

File.foreach(c1) do |line| 
    square_to_find[position1]=line.chomp.split('').map(&:to_i)
    position1+=1
end

File.foreach(c2) do |line|
    data[position2]= line.chomp.split('').map(&:to_i)
    position2+=1
end 

def is_it_a_match?(square_to_find,data,line,column)
    line2=0
    while(line2<square_to_find.count)
        column2 = 0
        while(column2<square_to_find[line2].count)
            if(square_to_find[line2][column2]!=data[line+line2][column+column2])
                return (false)
            end
            column2+=1
        end
        line2+=1
    end 
    return true
end

def rectangle(square_to_find,data)
    line=0
    while (line<data.count)
        column=0
        while(column<data[line].count)
            if(data[line][column]==square_to_find[0][0])
                if(is_it_a_match?(square_to_find,data,line,column))
                    puts "#{column},#{line}"
                    #puts "#{data[line][column]}"
                    return (true)
                end
            end
            column +=1
        end
        line+=1
    end
    puts "PAS DE MATCH"
    return (false)
end

rectangle(square_to_find,data)
        









