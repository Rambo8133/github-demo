if (ARGV.length !=1 )
    puts "Please #{(__FILE__)} need than you select only one argument!"
    exit
end

number = ARGV[0].to_i
#puts number //simple test

#Fonction factoriel
def factoriel (number)
	i=1
	f=1
	while i<=number
		f=f*i
		i=i+1
	end
	p f
end

factoriel (number)