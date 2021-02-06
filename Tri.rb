array=[]

for i in ARGV
	array.push ARGV[i].to_i
end

#Fonction tri
def tri (array)
	array=array.sort!
	array=array.reverse
	p array
end

puts tri(array)