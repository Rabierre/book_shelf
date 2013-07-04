require File.expand_path(File.dirname(__FILE__) + '/book_shelf.rb')

class CLI
    attr_accessor :bookshelf

    def initialize
        @bookshelf = BookShelf.new
        @bookshelf.loadShelf
    end

    def fetch
        print ">> "

        loop do |line = gets.chomp!|
            case line
            when "quit"
                break
            when "list"
                @bookshelf.listBooks
            when "add"
                bookInfo = gets.chomp!.split(",").each { |info| info.strip! }
                @bookshelf.addBook Book.new(bookInfo[0], bookInfo[1])
            when "save"
                @bookshelf.saveList
            when "help"
                puts "list, add, save"
            else
                puts "There's no such instruction [#{line}]!"
            end
            print ">>"
        end
    end
end

# Do CMD Process
CLI.new.fetch