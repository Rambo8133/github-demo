if (ARGV.length !=1 )
    puts "Please #{(__FILE__)} need than you select only one argument!"
    exit
end

number = ARGV[0].to_i
#puts number //simple test

#fonction escalier.
def escalier(number)
	i=1
	while i <= number
		puts "\#"*i
		i=i+1
	end
end

puts escalier(number)

