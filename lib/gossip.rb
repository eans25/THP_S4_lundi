

class Gossip
	attr_accessor :author, :content
	

	def initialize(author, content)
		@author = author
		@content = content
	end


	def save
	  	CSV.open("./db/gossip.csv", "ab") do |csv|
	    csv << [@author, @content]
	    puts "Votre message à été envoyé"
	  	end
	end

	def self.all
	  	all_gossips = []
	  		CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  	end
	  	all_gossips
	end

end