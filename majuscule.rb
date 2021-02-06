if (ARGV.length !=1 )
    puts "Please #{(__FILE__)} need than you select only one argument!"
    exit
end

string = ARGV[0].dup
#puts string

#Fonction majuscule
def majuscule(string)
	i = 0
	while i<string.length
		if i == i.to_i
			if (i % 2) == 0
				string[i]=string[i].downcase
				i=i+1
			else
				string[i]=string[i].upcase
				i=i+1
			end
		else
			puts "Bug !"
		end
	end	
	puts string
end

puts majuscule(string)