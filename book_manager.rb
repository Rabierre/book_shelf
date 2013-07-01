class BookManager
	attr_accessor :books

	def initialize
		@books = []
	end

	def addBook book
		books.push book
	end
	
    def saveList
    	f = File.open("books.txt", "w")
    	books.each {|book| f.write(book)}
    	f.close
    end

    def listBooks
    	index = 0
    	loop do
    		break if (index >= books.length)

    		puts "#{index+1} : #{books[index]}"
    		index+=1
    	end
    end

    def loadBooks
    	f = File.open("books.txt", "r")
    	books.push(f.read)
    	f.close
	end

	def clearBooks
		@books = []
	end

	def held? cartList
		held = []
		books & cartList
	end
end

#books.push "hadoop in action"
#puts books

bookmanager = BookManager.new

bookmanager.addBook "Hadoop in action"
bookmanager.addBook "The art of readable code"
bookmanager.books.each {|book| print book," "}
puts
bookmanager.saveList

#bookmanager.books = []
bookmanager.listBooks
puts bookmanager.books

# held = "Hadoop in action", "The art of readable code"
cartList = ["Hadoop in action"]
print "You already held #{bookmanager.held?(cartList)}\n"