class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def initialize(input={})
        # puts input
        @id = input[:id]
        @name = input[:name]
        @type = input[:type]
        @db = input[:db]
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)

    end
    
    def self.find(id_num, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        returnedData = db.execute(sql, id_num).flatten        
        Pokemon.new(id: returnedData[0], name: returnedData[1], type: returnedData[2], db: db)
    end

end
