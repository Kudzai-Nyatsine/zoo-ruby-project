class Zoo
	attr_accessor :id, :title, :sea, :forest, :safari, :mountains

	def save
		conn = Zoo.open_connection

		if(!self.id)
			sql = "INSERT INTO zoo (title,sea,forest,safari,mountains) VALUES ('#{self.title}','#{self.sea}','#{self.forest}','#{self.safari}','#{self.mountains}')"
		else
			sql = "UPDATE zoo SET title = '#{self.title}',sea ='#{self.sea}',forest='#{self.forest}',safari='#{self.safari}' WHERE id = '#{self.id}'"
		end

		conn.exec(sql)
	end

	def self.open_connection
		conn = PG.connect(dbname: 'zoo' )
	end

	def self.all
		conn = self.open_connection
		sql = "SELECT * FROM zoo ORDER BY id"
		results = conn.exec(sql)

		zoos = results.map do |tuple|
			self.hydrate tuple
		end

		zoos
	end

	def self.find id
		conn = self.open_connection
		sql = "SELECT * FROM zoo WHERE id = #{id} LIMIT 1"
		zoos = conn.exec(sql)
		zoo = self.hydrate zoos[0]

		zoo
	end

	def self.destroy id
		conn = self.open_connection
		sql = "DELETE FROM zoo where id = #{id}"
		conn.exec(sql)
	end

	def self.hydrate zoo_info
		zoo = Zoo.new
		zoo.id = zoo_info['id']
		zoo.title = zoo_info['title']
		zoo.sea = zoo_info['sea']
		zoo.forest = zoo_info['forest']
		zoo.safari = zoo_info['safari']
		zoo.mountains = zoo_info['mountains']

		zoo
	end
end

