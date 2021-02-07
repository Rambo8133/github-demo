if (ARGV.length <1 )
    puts "Please #{(__FILE__)} need than you select at least one argument!"
    exit
end


i = 0
while (i < ARGV.length-1)
   
    if (ARGV[i].to_i<ARGV[i+1].to_i)
        switch_g=ARGV[i+1]
        switch_p=ARGV[i]
        ARGV[i]=switch_g
        ARGV[i+1]=switch_p
        i=0
    else 
        i=i+1
    end
    
end

puts ARGV.join(' ')