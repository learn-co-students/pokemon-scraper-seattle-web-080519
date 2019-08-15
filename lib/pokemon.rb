class Pokemon
    attr_reader :name, :type, :id, :db

    def initialize(billy_bob)
        @name = billy_bob[:name] 
        @type = billy_bob[:type]
        @id = billy_bob[:id]
        @db = billy_bob[:db]
    end 

    def self.all
        sql = "SELECT * FROM pokemon"
        @db.execute(sql)
    end

    def self.save(name, type, db)
        # puts db
        sql = "INSERT INTO pokemon(name, type) VALUES(?, ?)"
        #No @ sign in front of db because db was passed as a parameter.
        db.execute(sql, name, type)

    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        
        found_pokemon = db.execute(sql, id).flatten
        # found_pokemon.flatten!
        puts found_pokemon
        pokemon_hash = {
            id: found_pokemon[0],
            name: found_pokemon[1],
            type: found_pokemon[2],
            db: db
        }

        Pokemon.new(pokemon_hash)
    end

    


end
