sudoku=ARGV[0]
s_without_grid=[]

z=0

File.foreach(sudoku) do
    |line| s_without_grid[z]=line.chomp; z+=1
end

for i in 0..(s_without_grid.length-1) do 
    s_without_grid[i]=s_without_grid[i].gsub("|","")
end

s_without_grid.delete_at(3)
s_without_grid.delete_at(6)

for i in 0..(s_without_grid.length-1) do 
    s_without_grid[i]=s_without_grid[i].split('').map(&:to_i)
end

#Note : à partir de là il va faloir prendre la valeur 
#et la position de la valeur manquante. Dans la ligne mais aussi dans la colonne
#puis enfin dans les 9 carrés

mis_v_carre_tot=[]
#check valeur manquante carré 1
mis_v_carre_1=[1,2,3,4,5,6,7,8,9]
for i in 0..2
    for j in 0..2
        if(s_without_grid[i][j]!=0)
            mis_v_carre_1.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_1)

#check valeur manquante carré 2
mis_v_carre_2=[1,2,3,4,5,6,7,8,9]
for i in 0..2
    for j in 3..5
        if(s_without_grid[i][j]!=0)
            mis_v_carre_2.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_2)

#check valeur manquante carré 3
mis_v_carre_3=[1,2,3,4,5,6,7,8,9]
for i in 0..2
    for j in 6..8
        if(s_without_grid[i][j]!=0)
            mis_v_carre_3.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_3)

#check valeur manquante carré 4
mis_v_carre_4=[1,2,3,4,5,6,7,8,9]
for i in 3..5
    for j in 0..2
        if(s_without_grid[i][j]!=0)
            mis_v_carre_4.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_4)

#check valeur manquante carré 5
mis_v_carre_5=[1,2,3,4,5,6,7,8,9]
for i in 3..5
    for j in 3..5
        if(s_without_grid[i][j]!=0)
            mis_v_carre_5.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_5)

#check valeur manquante carré 6
mis_v_carre_6=[1,2,3,4,5,6,7,8,9]
for i in 3..5
    for j in 6..8
        if(s_without_grid[i][j]!=0)
            mis_v_carre_6.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_6)

#check valeur manquante carré 7
mis_v_carre_7=[1,2,3,4,5,6,7,8,9]
for i in 6..8
    for j in 0..2
        if(s_without_grid[i][j]!=0)
            mis_v_carre_7.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_7)

#check valeur manquante carré 8
mis_v_carre_8=[1,2,3,4,5,6,7,8,9]
for i in 6..8
    for j in 3..6
        if(s_without_grid[i][j]!=0)
            mis_v_carre_8.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_8)

#check valeur manquante carré 9
mis_v_carre_9=[1,2,3,4,5,6,7,8,9]
for i in 6..8
    for j in 6..8
        if(s_without_grid[i][j]!=0)
            mis_v_carre_9.delete(s_without_grid[i][j])
        end
    end
end

mis_v_carre_tot.push(mis_v_carre_9)

### Les 9 fonctions pour les carrées peuvent être réduites en 1 seule qui incrémente 
### les i et j des boucles for par 3 lorsque tour fini.


### On check les valeurs manquantes sur les lignes
mis_v_line=[]

for i in 0..8
    vect=[1,2,3,4,5,6,7,8,9]
    for j in 0..8
        vect.delete(s_without_grid[i][j])
    end
    mis_v_line.push(vect)
end 

### On check les valeurs manquantes sur les colonnes
mis_v_colu=[]
s_without_grid_t=s_without_grid.transpose

for i in 0..8
    vect=[1,2,3,4,5,6,7,8,9]
    for j in 0..8
        vect.delete(s_without_grid_t[i][j])
    end
    mis_v_colu.push(vect)
end 

### Il n'y a plus qu'a résoudre on connait les valeurs et les positions !

# Résolution Dans le carré 1
if(mis_v_carre_tot[0]!=[])
    for i in 0..2
        for j in 0..2
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[0]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[0])[0]
            end
        end
    end
end

# Résolution Dans le carré 2
if(mis_v_carre_tot[1]!=[])
    for i in 0..2
        for j in 3..5
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[1]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[1])[0]
            end
        end
    end
end

# Résolution Dans le carré 3
if(mis_v_carre_tot[2]!=[])
    for i in 0..2
        for j in 6..8
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[2]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[2])[0]
            end
        end
    end
end

# Résolution Dans le carré 4
if(mis_v_carre_tot[3]!=[])
    for i in 3..5
        for j in 0..2
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[3]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[3])[0]
            end
        end
    end
end

# Résolution Dans le carré 5
if(mis_v_carre_tot[4]!=[])
    for i in 3..5
        for j in 3..5
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[4]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[4])[0]
            end
        end
    end
end

# Résolution Dans le carré 6
if(mis_v_carre_tot[5]!=[])
    for i in 3..5
        for j in 6..8
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[5]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[5])[0]
            end
        end
    end
end

# Résolution Dans le carré 7
if(mis_v_carre_tot[6]!=[])
    for i in 6..8
        for j in 0..2
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[6]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[6])[0]
            end
        end
    end
end

# Résolution Dans le carré 8
if(mis_v_carre_tot[7]!=[])
    for i in 6..8
        for j in 3..5
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[7]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[7])[0]
            end
        end
    end
end

# Résolution Dans le carré 9
if(mis_v_carre_tot[8]!=[])
    for i in 6..8
        for j in 6..8
            if(mis_v_colu[j]&mis_v_line[i]&mis_v_carre_tot[8]!=[])
                  s_without_grid[i][j]=(mis_v_colu[j] & mis_v_line[i] & mis_v_carre_tot[8])[0]
            end
        end
    end
end

p s_without_grid