require File.expand_path(File.dirname(__FILE__) + '/book.rb')


class BookShelf
	attr_accessor :books, :owner

    def initialize owner="anon"
        # TODO self load
		@books = []
	end

	def addBook newBook
		books.push newBook
	end
	
    def saveList
    	f = File.open("books.txt", "w")
    	books.each {|book| f.print book.to_json,"\n" }
    	f.close
    end

    def listBooks
        puts "book shelf is empty!" if books.empty?

        index = 0    
    	books.each { |book| puts "#{index += 1} : " + book.to_s }
    end

    def loadShelf
    	f = File.open("books.txt", "r")
    	f.read.each_line {|line| books.push(Book.load line) unless line.strip!.empty? }
    	f.close
	end

	def clearShelf
		@books = []
	end

	def held? cartList
		books & cartList
	end
end

=begin
bookshelf = BookShelf.new

bookshelf.addBook Book.new("Hadoop in action", "Someone", Date.new(2013,7,1))
bookshelf.addBook Book.new("The art of readable code", "Dustin Boswel", Date.new(2013,7,1))
bookshelf.listBooks

bookshelf.saveList
puts

# held = "Hadoop in action", "The art of readable code"
cartList = Array(Book.new("Hadoop in action", "Someone", Date.new(2013,)))
print "You already held #{bookshelf.held?(cartList)}\n"
=end