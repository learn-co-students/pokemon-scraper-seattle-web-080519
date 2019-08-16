require 'pry'
class Pokemon
    attr_reader :id, :name, :type, :db
    attr_accessor :hp
    def initialize(arg)
        @id = arg[:id]
        @name = arg[:name]
        @type = arg[:type]
        @db = arg[:db]
        @hp = arg[:hp]
    end
    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?,?)"
        db.execute(sql, name, type)
    end
    def self.find(id, db)
        sql = "select * from pokemon where id = ?"
       h = db.execute(sql, id).flatten
       Pokemon.new(id: h[0], type: h[2], name: h[1], hp: h[3])
    end
    def alter_hp(hp, db)
        sql = "select * from pokemon where id = ?"
       h = db.execute(sql, id).flatten
      print h
        db.execute("UPDATE pokemon SET hp= ? WHERE id=? ", hp, self.id)
        # via heredoc
        # sql = <<-SQL
        #     UPDATE pokemon SET hp=? WHERE id=?
        # SQL
        # db.execute(sql, hp, self.id)
    end
end

