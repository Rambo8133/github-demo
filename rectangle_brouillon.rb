unless (ARGV.count ==2)
    puts "#{File.basename(__FILE__)}: pass rectangle data files as arguments"
exit
end 

def set_data(file)
    i=0
    res=[]
    File.foreach(file {|line| res[i] = []; res[i]+=line.chomp.split('').map(&:_to_i); i+=1})
    return(res)
end

def check_rectangle(r1,r2,x,y)
    for i in 0..(r1.count-1) do
        for j in 0..(r1[i].count-1) do
            next if (i==0 && j==0)
            if(r2[x+i].nil? || r2[x+i][y+j].nil? || r1[i][j]!=r2[x+i][y+j])
                return (false)
            end
        end 
    end
    return (true)
end

r1= set_data(ARGV[0])
r2= set_data(ARGV[1])
puts r1
puts r2
=begin
for i in 0..(r2.count - 1) do 
    for j in 0..(r2[i].count-1) do
        if (r2[i][j]==r1[0][0])
            if (check_rectangle(r1, r2, i, j))
                puts "#{j},#{i}"
                exit
            end
        end
    end
end
=end