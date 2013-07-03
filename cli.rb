require File.expand_path(File.dirname(__FILE__) + '/book_shelf.rb')

class CLI
	attr_accessor :bookshelf

	def initialize
		@bookshelf = BookShelf.new
		@bookshelf.loadBooks
	end

	def addBook title, author, date=Date.new
		bookshelf.addBook Book.new(title, author, date)
	end

	def showBookShelf
		bookshelf.listBooks
	end

	def fetch
		loop do 
			print ">>"
			line = gets.chomp!
			
			case line
			when !line || "quit"
				break
			when "list"
				self.showBookShelf
			when "add"
				bookInfo = gets.chomp!.split(",")
				bookInfo.each { |info| info.strip! }
				self.addBook bookInfo[0], bookInfo[1]
			when "save"
				# TODO problem here!
				@bookshelf.saveList
			else
				puts "There's no such instruction [#{line}]!"
			end
		end
	end
end

# initial status of book shelf
cli = CLI.new
cli.showBookShelf

# Add First Book into book shelf
#cli.addBook "The Very First Book", "Drew barrymore"
#cli.showBookShelf

# Cmd input
cli.fetch