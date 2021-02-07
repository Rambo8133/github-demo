word=ARGV[0].dup
file=ARGV[1].dup

array=[]
result=[]

#on pousse directement le mot recherché dans le tableau car il doit être affiché à la fin dans le résultat
#result.push(word)  : sert à rien en fait

z=0

# On transforme le fichier en tableau de 1 colonnes et x lignes
File.foreach(file) do
    |line| array[z]=line.chomp; z+=1
end

# On décompose la mot en tableau puis on ordonne, 
#ceci permet de détecter directement un anagramme
def decomp_word(word)
    word_decomp=word.split('')
    word_decomp=word_decomp.sort!
    return word_decomp
end

for i in 0..(array.length-1) do
    if(decomp_word(word)==decomp_word(array[i]))
        result.push(array[i])
        i=i+1
    else
        i=i+1
    end
end

puts result

