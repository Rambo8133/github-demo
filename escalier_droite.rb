if (ARGV.length !=1 )
    puts "Please #{(__FILE__)} need than you select only one argument!"
    exit
end

number = ARGV[0].to_i
#puts number //simple test

#fonction escalier avec les espace comme dans le pdf
def escalier_space(number)
	i=1
	j=number-i
	while i <= number
		puts " "*j+"\#"*i
		i=i+1
		j=j-1
	end
end

puts escalier_space(number)

