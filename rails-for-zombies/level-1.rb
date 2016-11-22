################################################
#Level 1
################################################

#Try to find a Zombie where the ID is 1.
 z = Zombie.find(1)

#Create a new Zombie.
 z = Zombie.create(name: "Joe", graveyard: "Main St")

#3Find the last Zombie in the database, but don't use IDs
 z = Zombie.last

#Find all Zombies ordered by their names.
 z = Zombie.all.order(:name)

#Update Zombie 3's graveyard to 'Benny Hills Memorial'
 z = Zombie.find(3)
 z.update(graveyard: "Benny Hills Memorial")

#Destroy the Zombie with an ID of 3.
 z = Zombie.find(3).destroy
