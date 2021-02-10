unless (ARGV.count == 1)
    puts "#{__FILE__} usage: integer."
    exit
end 

n = ARGV[0].to_i

def factoriel(n=0)
    return(1) if (n<=0)
    return(n*factoriel(n-1))
end

puts factoriel(n).to_s.reverse.gsub(/(\d{3})(?=\d)/,'\1,').reverse