#fonction escalier.
def escalier(number)
	i=1
	while i <= number
		puts "\#"*i
		i=i+1
	end
end

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
			puts "Merci de saisir un nombre entier"
		end
	end	
	p string
end


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


#Fonction tri
def tri (array)
	array=array.sort!
	array=array.reverse
	p array
end

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








	
