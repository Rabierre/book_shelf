require File.expand_path(File.dirname(__FILE__) + '/book_shelf.rb')

class CLI
    attr_accessor :bookshelf

    def initialize
        @bookshelf = BookShelf.new
        @bookshelf.loadShelf
    end

    def fetch
        print ">> "

        loop do |line = gets.chomp!.strip|
            case line
            when "quit"
                break
            when "list"
                @bookshelf.listBooks
            when "add"
                print "title         : "; title = gets.chomp!.strip
                print "author        : "; author = gets.chomp!.strip
                print "purchased day : "; purchasedDate = gets.chomp!.strip
                print "read          : "; read = gets.chomp!.strip
                print "opened        : "; opened = gets.chomp!.strip

                @bookshelf.addBook Book.new(title, author, purchasedDate, to_b(read), to_b(opened))
            when "save"
                @bookshelf.saveList
            when "read"
                puts @bookshelf.readList
            when "unread"
                puts @bookshelf.unreadList
            when "unopen"
                puts @bookshelf.unopenedList
            when "help"
                puts "quit, list, add, save, read, unread, unopen"
            else
                puts "There's no such instruction [#{line}]!"
            end
            print ">>"
        end
    end

    def to_b string
       return true if string =~ (/(true|t|yes|y|1)$/i)
       return false if string =~ (/(false|f|no|n|0)$/i)
    end
end

# Do CMD Process
CLI.new.fetch