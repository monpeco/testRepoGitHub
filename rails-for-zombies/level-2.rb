################################################
#Level 2
################################################

=begin
    class Zombie < ActiveRecord::Base
    	has_many :tweets
    
    end
    
    class Tweet < ActiveRecord::Base
    	belongs_to :zombie
    
    end
    
    ash = Zombie.find(3)
    ash.tweets.count
    
    t = Tweet.finf(5)
    t.zombie.name
    
    #Define a Zombie model.
    class Zombie < ActiveRecord::Base
      
    end
=end

#Add a validation that checks for the presence of a Zombie's name
class Zombie < ActiveRecord::Base
  validates :name, presence: true
end

#Add a validation that checks for the uniqueness of a Zombie's name.
class Zombie < ActiveRecord::Base
  validates :name, uniqueness: true
end

#Validate both the uniqueness and the presence of a Zombie's name on a single line, using the new validation syntax.
class Zombie < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end

#A Weapon belongs to a Zombie. Create that relationship.
class Weapon < ActiveRecord::Base
  belongs_to :zombie
end

#Assuming the models and relationships are properly defined, find all the weapons that belong to Zombie 'Ashley'
 z = Zombie.find(1)
 z.weapons

 z = Zombie.find(1).weapons
