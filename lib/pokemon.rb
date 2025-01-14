class Pokemon
  
   attr_accessor :id,:name, :type, :hp, :db 
   
# def initialize(id=nil,name,type,db)
#   @id = id
#   @type =type
#   @db = db
      
# end

def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

def self.save(name, type, db)
    # sql = <<-SQL
    # "INSERT INTO pokemon (name, type)
    # VALUES (?, ?)"
    # SQL
    
    # DB[:conn].execute(sql, self.name, self.type)
    
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)

end


def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  
def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
