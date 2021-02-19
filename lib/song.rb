# class Song
#     attr_accessor :name, :copies_sold, :id

#     def initialize(id=nill, name, copies_sold)
#         @id = id
#         @name = name
#         @copies_sold = copies_sold
#     end

#     def self.create_table
#         sql = <<-SQL
#             CREATE TABLE IF NOT EXISTS songs(
#                 id INTEGER PRIMARY KEY,
#                 name TEXT,
#                 copies_sold INTEGER
#             );
#         SQL        
        
#         DB[:conn].execute(sql)
#     end

#     def save
#         sql = <<-SQL
#          INSERT INTO songs (name, copies_sold)
#          VALUES (?, ?)
#         SQL

#         DB[:conn].execute(sql, self.name, self.copies_sold)

#         @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]

#         self
#     end

#     def self.create(name:, copies_sold:0)
#         song = Song.new(name, copies_sold)
#         song.save
#     end

#     def self.find_by_name

#     end

#     def self.update

#     end
# end

class Song 
    attr_accessor :name, :copies_sold, :id
  
    def initialize(id=nil, name, copies_sold)
      @id = id 
      @name = name 
      @copies_sold = copies_sold
    end
  
    ## create the table 
    def self.create_table
      sql = <<-SQL 
        CREATE TABLE IF NOT EXISTS songs(
          id INTEGER PRIMARY KEY,
          name TEXT,
          copies_sold INTEGER
        )
      SQL
  
      DB[:conn].execute(sql)
    end 
  
    ## shouldnt return the obj => but it can if you decide to make it
    def save 
      sql = <<-SQL
        INSERT INTO songs (name, copies_sold)
        VALUES (?, ?)
      SQL
  
      DB[:conn].execute(sql, self.name, self.copies_sold)
  
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  
      self
    end 
  
    def self.create(name:, copies_sold:) 
      song = Song.new(name, copies_sold)
      song.save
      song 
    end

    def self.find_by_name(name)
        sql = <<-SQL
         SELECT * 
         FROM songs
         WHERE name = ?
         LIMIT 1
        SQL
        DB[:conn].execute(sql)
    end

    def self.update(name, id)
        sql = <<-SQL
         UPDATE songs
         SET name = ?
         WHERE id = ?
        SQL

        DB[:conn].execute(sql, name, id)

    end
end
  