if (ARGV.length !=1 )
    puts "Please #{(__FILE__)} need than you select only one argument!"
    exit
end

number = ARGV[0].to_i
#puts number //simple test

#Fonction factoriel avec exposant  
def factoriel_exp (number)
	i=1
	f=1
	while i<=number
		f=f*i
		i=i+1
	end
	exp="%e" %f
	p exp
end

factoriel_exp (number)