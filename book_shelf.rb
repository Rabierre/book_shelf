require File.expand_path(File.dirname(__FILE__) + '/book.rb')


class BookShelf
	attr_accessor :books

    def initialize
        # TODO self load
		@books = []
	end

	def addBook newBook
		books.push newBook
	end
	
    def saveList
    	f = File.open("books.txt", "a")
    	books.each {|book| f.print book.to_json,"\n" }
    	f.close
    end

    def listBooks
	    if books.empty?
            puts "book shelf is empty!"
        end

        index = 0    
    	books.each { |book| puts "#{index += 1} : " + book.to_s }
    end

    def loadBooks
    	f = File.open("books.txt", "r")
        #f.read.each {|line| books.push JSON.parse(line)}
        #puts JSON.parse(f.read)
        #lines = f.read.split("\n")
        #lines.each {|line| books.push(Book.new.load line) }
    	f.read.each_line {|line| books.push(Book.new.load line) }
    	f.close
	end

	def clearBooks
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