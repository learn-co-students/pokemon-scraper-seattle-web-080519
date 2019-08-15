class Pokemon
    
    attr_accessor :id, :name, :type, :db

    def initialize(keyword)
        @id=keyword[:id]
        @name=keyword[:name]
        @type=keyword[:type]
        @db=keyword[:db]
    end

    def self.save(name, type, db)
        sql = 
        <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES (?,?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = 
        <<-SQL
            SELECT * FROM pokemon 
            WHERE id=?
        SQL
        response = db.execute(sql, id).flatten
        Pokemon.new(id: response[0], name: response[1], type: response[2], hp: response[3], db: db)
    end

    
end
