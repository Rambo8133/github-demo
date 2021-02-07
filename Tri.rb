array=ARGV.dup


for j in (0..array.length-1)
	array[j]=array[j].to_i
end


#Fonction tri
def tri (array)
	array=array.sort!
	array=array.reverse
	p array
end

puts tri(array).join(' ')
